# UmaCards Supabase Migration Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Migrate backend from local JSON + SharedPreferences + (unused) Dart Frog to Supabase (managed Postgres + Auth + Storage + CDN). Wire up real auth, deck persistence, and remote card catalog. Fix existing bugs along the way.

**Architecture:** Replace `LocalCardRepository` → `SupabaseCardRepository` and `LocalDeckRepository` → `SupabaseDeckRepository`. Supabase Auth replaces mock login/register. Supabase Storage replaces `localhost:8080` hardcoded image URLs. The Dart Frog `server/` folder is kept as deprecated reference (not deleted). Card catalog migrates to a `cards` table so new cards can be added via SQL without rebuilding the app (~4 new cards every 2 weeks).

**Tech Stack:** Flutter, Riverpod, GoRouter, cached_network_image, `supabase_flutter`, Supabase (Postgres + Auth + Storage), Cloudflare Pages (web hosting).

## Global Constraints

- Repository pattern + Riverpod already in place — migration only touches the provider bindings and new impl files, not the UI screens (except bug fixes)
- `SupportCard` and `Deck` models stay as-is (fromJson/toJson already match Supabase column names: `unique_effect`, `card_ids`, `is_public`, `created_at`, `updated_at`)
- Card images use relative paths (`cards/kitasan_black.png`) resolved by repository `imageUrl()`
- Dart Frog `server/` is KEPT as reference but marked deprecated in `AGENTS.md`
- `supabase_flutter` SDK works on Web + Android + iOS (no platform loss)
- Free tier is sufficient for pre-prod scale (500MB DB, 1GB storage, 50k MAU)
- Supabase project URL + anon key are public (anon key is safe client-side; RLS enforces security)

---

## Phase 0: Supabase Project Setup

**Where:** Supabase dashboard (no code changes)

- [ ] **Step 1: Create Supabase project**
  - Sign up at supabase.com
  - Create new project, choose region closest to users
  - Annotate **Project URL** and **anon key** (Settings → API)

- [ ] **Step 2: Verify project is active**
  - Confirm dashboard shows project as running
  - Note: Free projects pause after 1 week of inactivity (data preserved)

---

## Phase 1: Database Schema

**Where:** Supabase SQL Editor
**Produces:** Tables + RLS policies + trigger for auth

- [ ] **Step 1: Create `cards` table (public read, no login required)**

```sql
CREATE TABLE cards (
  id              TEXT PRIMARY KEY,
  name            TEXT NOT NULL,
  title           TEXT NOT NULL,
  image           TEXT NOT NULL,
  type            TEXT NOT NULL CHECK (type IN ('speed','stamina','power','guts','wit','friend')),
  rarity          TEXT NOT NULL CHECK (rarity IN ('ssr','sr','r')),
  effects         JSONB NOT NULL DEFAULT '{}',
  skills          JSONB NOT NULL DEFAULT '[]',
  unique_effect   TEXT,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE cards ENABLE ROW LEVEL SECURITY;
CREATE POLICY "cards_public_read" ON cards FOR SELECT USING (true);
```

- [ ] **Step 2: Create `decks` table (owner-scoped via RLS)**

```sql
CREATE TABLE decks (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  name        TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  card_ids    JSONB NOT NULL DEFAULT '[]',
  is_public   BOOLEAN NOT NULL DEFAULT false,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ
);

ALTER TABLE decks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "decks_owner_all"   ON decks FOR ALL    USING (user_id = auth.uid());
CREATE POLICY "decks_public_read" ON decks FOR SELECT USING (is_public = true);
```

- [ ] **Step 3: Create `profiles` table + auto-creation trigger**

```sql
CREATE TABLE profiles (
  id         UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username   TEXT UNIQUE NOT NULL,
  avatar_url TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "profiles_public_read" ON profiles FOR SELECT USING (true);
CREATE POLICY "profiles_owner_update" ON profiles FOR UPDATE USING (id = auth.uid());

CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'username', 'trainer_' || NEW.id::text));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();
```

- [ ] **Step 4: Verify tables in Table Editor**
  - Confirm `cards`, `decks`, `profiles` exist
  - Confirm RLS is enabled on all three

---

## Phase 2: Storage (Card Images)

**Where:** Supabase Storage dashboard
**Produces:** Public bucket for card images + CDN URLs

- [ ] **Step 1: Create public bucket `cards`**
  - Storage → New bucket → Name: `cards` → Public: ON

- [ ] **Step 2: Upload 200 card images**
  - Upload all images from `assets/images/cards/` to bucket root as `cards/{name}.png`
  - Verify public URLs accessible: `https://{project}.supabase.co/storage/v1/object/public/cards/kitasan_black.png`

- [ ] **Step 3: Confirm image paths in data match bucket filenames**
  - `cards.json` uses `"image": "cards/kitasan_black.png"` — these resolve directly via `getPublicUrl()`

---

## Phase 3: Seed Card Data

**Files:**
- Create: `tool/seed_cards.dart` (disposable script)

- [ ] **Step 1: Write seed script**

```dart
// tool/seed_cards.dart — run once, then discard
import 'dart:convert';
import 'dart:io';
import 'package:supabase/supabase.dart';

Future<void> main() async {
  final client = SupabaseClient(
    'https://{project}.supabase.co',
    '{anon-key}',
  );
  final json = jsonDecode(File('assets/cards.json').readAsStringSync()) as List;
  for (final card in json) {
    await client.from('cards').insert(card);
  }
  print('Seeded ${json.length} cards');
}
```

- [ ] **Step 2: Run seed script**

```bash
dart run tool/seed_cards.dart
```

- [ ] **Step 3: Verify cards in Table Editor**
  - Confirm 200 rows in `cards` table
  - Spot-check a card's effects JSONB and image path

- [ ] **Step 4: Decide on `assets/cards.json`**
  - Keep as fallback/seed reference, OR
  - Remove from `pubspec.yaml` assets to save ~90KB in web build (DB is now source of truth)

---

## Phase 4: Flutter SDK Integration

**Files:**
- Modify: `pubspec.yaml`
- Modify: `lib/main.dart`

- [ ] **Step 1: Add dependency**

```yaml
# pubspec.yaml
dependencies:
  # ... existing deps ...
  supabase_flutter: ^2.6.0
```

- [ ] **Step 2: Run pub get**

```bash
flutter pub get
```

- [ ] **Step 3: Initialize Supabase in `lib/main.dart`**

```dart
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://{project}.supabase.co',
    anonKey: '{anon-key}',
  );
  runApp(const ProviderScope(child: UmaCardsApp()));
}
```

- [ ] **Step 4: Move credentials to `--dart-define` (production)**
  - Replace hardcoded URL/key with `const String.fromEnvironment('SUPABASE_URL')`
  - Run with: `flutter run --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...`

- [ ] **Step 5: Verify app still boots**
  - `flutter analyze lib/` — no new errors
  - App launches without crash

---

## Phase 5: Supabase Repositories

**Files:**
- Create: `lib/core/repositories/supabase_card_repository.dart`
- Create: `lib/core/repositories/supabase_deck_repository.dart`
- Modify: `lib/core/providers/repository_providers.dart`

- [ ] **Step 1: Write `SupabaseCardRepository`**

```dart
// lib/core/repositories/supabase_card_repository.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uma_cards/features/catalog/domain/support_card_model.dart';
import 'card_repository.dart';

class SupabaseCardRepository implements CardRepository {
  final _client = Supabase.instance.client;
  List<SupportCard>? _cached;

  @override
  Future<List<SupportCard>> getAll() async {
    if (_cached != null) return _cached!;
    final data = await _client.from('cards').select().order('name');
    _cached = data.map(SupportCard.fromJson).toList();
    return _cached!;
  }

  @override
  Future<SupportCard?> getById(String id) async {
    final cards = await getAll();
    for (final c in cards) {
      if (c.id == id) return c;
    }
    return null;
  }

  @override
  List<SupportCard> filter({
    required List<SupportCard> cards,
    List<String> types = const [],
    List<String> rarities = const [],
    String search = '',
  }) {
    return cards.where((c) {
      if (types.isNotEmpty && !types.contains(c.type)) return false;
      if (rarities.isNotEmpty && !rarities.contains(c.rarity)) return false;
      if (search.isNotEmpty &&
          !c.name.toLowerCase().contains(search.toLowerCase())) return false;
      return true;
    }).toList();
  }

  @override
  String imageUrl(String relativePath) =>
      _client.storage.from('cards').getPublicUrl(relativePath);
}
```

- [ ] **Step 2: Write `SupabaseDeckRepository`**

```dart
// lib/core/repositories/supabase_deck_repository.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uma_cards/features/decks/domain/deck_model.dart';
import 'deck_repository.dart';

class SupabaseDeckRepository implements DeckRepository {
  final _client = Supabase.instance.client;

  @override
  Future<List<Deck>> getAll() async {
    final data = await _client.from('decks')
        .select()
        .order('created_at');
    // RLS filters to current user's decks automatically
    return data.map(Deck.fromJson).toList();
  }

  @override
  Future<void> save(Deck deck) async {
    final userId = _client.auth.currentUser!.id;
    await _client.from('decks').upsert({
      ...deck.toJson(),
      'user_id': userId,
      'updated_at': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> delete(String id) async {
    await _client.from('decks').delete().eq('id', id);
  }
}
```

- [ ] **Step 3: Swap provider bindings**

```dart
// lib/core/providers/repository_providers.dart
final cardRepositoryProvider = Provider<CardRepository>((ref) {
  return SupabaseCardRepository();   // was LocalCardRepository()
});

final deckRepositoryProvider = Provider<DeckRepository>((ref) {
  return SupabaseDeckRepository();   // was LocalDeckRepository()
});
```

- [ ] **Step 4: Verify catalog loads from Supabase**
  - App shows 200 cards from DB (not local JSON)
  - Images load from Supabase Storage CDN
  - Filters still work (pure logic, unchanged)

---

## Phase 6: Auth with Supabase

**Files:**
- Create: `lib/core/providers/auth_providers.dart`
- Modify: `lib/features/auth/presentation/login_screen.dart`
- Modify: `lib/features/auth/presentation/register_screen.dart`
- Modify: `lib/features/profile/presentation/profile_screen.dart`
- Modify: `lib/app.dart` (GoRouter redirect)

- [ ] **Step 1: Create auth state providers**

```dart
// lib/core/providers/auth_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateProvider = StreamProvider<AuthState?>((ref) {
  return Supabase.instance.client.auth.onAuthStateChange;
});

final currentUserProvider = Provider<User?>((ref) {
  ref.watch(authStateProvider);
  return Supabase.instance.client.auth.currentUser;
});
```

- [ ] **Step 2: Refactor `login_screen.dart` to email + Supabase Auth**

```dart
// Replace _handleLogin with:
void _handleLogin() async {
  setState(() => _loading = true);
  try {
    await Supabase.instance.client.auth.signInWithPassword(
      email: _emailCtrl.text.trim(),
      password: _passwordCtrl.text,
    );
    if (mounted) context.go('/');
  } on AuthException catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  } finally {
    if (mounted) setState(() => _loading = false);
  }
}
```

- Change username field → email field in UI
- Remove mock `Future.delayed`

- [ ] **Step 3: Refactor `register_screen.dart`**

```dart
void _handleRegister() async {
  setState(() => _loading = true);
  try {
    await Supabase.instance.client.auth.signUp(
      email: _emailCtrl.text.trim(),
      password: _passwordCtrl.text,
      data: {'username': _usernameCtrl.text.trim()},
    );
    if (mounted) context.go('/');
  } on AuthException catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  } finally {
    if (mounted) setState(() => _loading = false);
  }
}
```

- The `data: {'username': ...}` flows to `raw_user_meta_data` → trigger creates `profiles` row

- [ ] **Step 4: Refactor `profile_screen.dart`**
  - Convert to `ConsumerWidget`
  - Watch `currentUserProvider` for real username/email
  - Fetch deck count from `deckRepositoryProvider.getAll()`
  - Add logout button: `await Supabase.instance.client.auth.signOut()`

- [ ] **Step 5: Add GoRouter redirect + `/login` `/register` routes**

```dart
// lib/app.dart — in routerProvider
final authState = ref.watch(authStateProvider).valueOrNull;
final isLoggedIn = authState?.session != null;

return GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final onAuthRoute = state.matchedLocation == '/login' ||
                        state.matchedLocation == '/register';
    if (onAuthRoute && isLoggedIn) return '/';
    return null;
  },
  routes: [
    // ... existing routes ...
    GoRoute(path: '/login',    builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
  ],
);
```

- [ ] **Step 6: Verify auth flow end-to-end**
  - Register → creates user + profile row
  - Login → session persists, app navigates to home
  - Logout → returns to login screen
  - Restart app → session restored (SDK persists token)

---

## Phase 7: Bug Fixes (Leveraging Migration)

**Files:**
- Modify: `lib/features/decks/presentation/deck_builder_screen.dart`
- Modify: `lib/features/decks/presentation/my_decks_screen.dart`
- Modify: `lib/features/catalog/presentation/card_detail_screen.dart`
- Modify: `lib/features/compare/presentation/compare_screen.dart`
- Modify: multiple screens (navigation unification)

- [ ] **Step 1: `DeckBuilderScreen._saveDeck()` — persist for real**

```dart
void _saveDeck() async {
  if (_nameCtrl.text.trim().isEmpty) return;
  final repo = ref.read(deckRepositoryProvider);
  await repo.save(Deck(
    id: widget.deckId ?? const Uuid().v4(),
    name: _nameCtrl.text.trim(),
    description: _descCtrl.text.trim(),
    cardIds: _selectedIds,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ));
  if (mounted) context.go('/decks');
}
```

- [ ] **Step 2: `MyDecksScreen` — read real decks from repository**
  - Convert `StatelessWidget` → `ConsumerWidget`
  - Use `FutureBuilder` or Riverpod `FutureProvider` wrapping `deckRepositoryProvider.getAll()`
  - Render list of decks (name, card count, created date)
  - Show empty state only when `getAll()` returns `[]`

- [ ] **Step 3: `CardDetailScreen` "Add to Deck" — real action**
  - Replace `Navigator.pushNamed(context, '/decks')` with opening DeckBuilder preselecting the card, OR add card to a draft deck

- [ ] **Step 4: `CompareScreen` — type the `List` parameters**
  - Change `_buildCardHeaders(BuildContext, WidgetRef, List cards)` → `List<SupportCard> cards`
  - Change `_buildEffectRow(BuildContext, String, List cards)` → `List<SupportCard> cards`

- [ ] **Step 5: Unify navigation to GoRouter**
  - Replace all `Navigator.pushNamed(context, '/route')` with `context.go('/route')` (replace) or `context.push('/route')` (stack)
  - Ensure all routes referenced exist in GoRouter config

- [ ] **Step 6: Verify `flutter analyze lib/` is clean**

---

## Phase 8: Documentation & Cleanup

**Files:**
- Modify: `AGENTS.md`
- Modify: `analysis_options.yaml` (keep `server/**` excluded)
- Modify: `pubspec.yaml` (remove `assets/cards.json` if DB is sole source of truth)

- [ ] **Step 1: Update `AGENTS.md`**
  - Backend: Supabase (Postgres + Auth + Storage), not Dart Frog
  - Auth: Supabase Auth (JWT managed by SDK), no manual JWT/bcrypt
  - Images: Supabase Storage + CDN, not `localhost:8080`
  - Cards: source of truth is `cards` table in Supabase (add via SQL Editor)
  - `server/` folder: DEPRECATED, kept as reference only — do not modify or run
  - Web deploy: Cloudflare Pages (`flutter build web` → `build/web`)

- [ ] **Step 2: Keep `server/` excluded from analyzer**
  - `analysis_options.yaml` already excludes `server/**` — leave as-is

- [ ] **Step 3: Decide on `assets/cards.json`**
  - If removing from bundle: delete from `pubspec.yaml` flutter assets + delete file
  - If keeping as seed reference: leave as-is, add comment in `AGENTS.md`

- [ ] **Step 4: Remove `serve_uma_cards.bat` (optional)**
  - Only needed for local python http.server pre-prod setup — superseded by Cloudflare Pages
  - Keep if you want a local-dev fallback

---

## Phase 9: Deployment

**Where:** Cloudflare Pages dashboard + Flutter build

- [ ] **Step 1: Build Flutter web**

```bash
flutter build web --release \
  --dart-define=SUPABASE_URL=... \
  --dart-define=SUPABASE_ANON_KEY=...
```

- [ ] **Step 2: Connect repo to Cloudflare Pages**
  - Cloudflare dashboard → Pages → Create project → Connect to Git
  - Select `MaximillionSnyder/umacompare`, branch `dev`
  - Build command: `flutter build web --dart-define=...`
  - Output directory: `build/web`

- [ ] **Step 3: Verify web deployment**
  - Site loads, catalog shows 200 cards from Supabase
  - Login/register works
  - Images load from Storage CDN

- [ ] **Step 4: Android build (no platform changes needed)**
  - `supabase_flutter` works natively on Android
  - SDK persists session in secure storage automatically
  - Ensure `AndroidManifest.xml` has `<uses-permission android:name="android.permission.INTERNET"/>` (default in Flutter projects)
  - Build: `flutter build apk --dart-define=...`

- [ ] **Step 5: Verify Android build**
  - App installs, catalog loads, auth works, decks persist across restarts

---

## Summary: Files Touched

| File | Action |
|---|---|
| `pubspec.yaml` | Add `supabase_flutter`; optionally remove `assets/cards.json` |
| `lib/main.dart` | Initialize Supabase |
| `lib/app.dart` | Add `/login` `/register` routes + auth redirect |
| `lib/core/providers/repository_providers.dart` | Swap to Supabase impls |
| `lib/core/providers/auth_providers.dart` | **NEW** — auth state providers |
| `lib/core/repositories/supabase_card_repository.dart` | **NEW** |
| `lib/core/repositories/supabase_deck_repository.dart` | **NEW** |
| `lib/features/auth/presentation/login_screen.dart` | Email + Supabase Auth |
| `lib/features/auth/presentation/register_screen.dart` | Supabase Auth |
| `lib/features/profile/presentation/profile_screen.dart` | Real user + logout |
| `lib/features/decks/presentation/deck_builder_screen.dart` | Persist via repo |
| `lib/features/decks/presentation/my_decks_screen.dart` | Read decks from repo |
| `lib/features/catalog/presentation/card_detail_screen.dart` | Real "Add to Deck" |
| `lib/features/compare/presentation/compare_screen.dart` | Type `List<SupportCard>` |
| `AGENTS.md` | Update docs (Supabase, deprecate server/) |
| `tool/seed_cards.dart` | **NEW** — one-time seeding |
| SQL (Supabase) | Tables + RLS + trigger + bucket |
| `server/` | Kept as reference (deprecated) |

## Execution Order

1. **Phase 1 + 2** (Schema + Storage) — in Supabase, no code
2. **Phase 3** (Seed cards) — one-time data migration
3. **Phase 4 + 5** (SDK + repos) — app loads cards from Supabase
4. **Phase 6** (Auth) — login/register functional
5. **Phase 7** (Bug fixes) — wire up decks, fix routing
6. **Phase 8** (Docs) — update AGENTS.md
7. **Phase 9** (Deploy) — Cloudflare Pages + Android

Each phase is independently deployable and testable.

## Notes

- Supabase anon key is safe to ship in client (RLS enforces security at DB level)
- For production, consider Pro plan ($25/mo) to avoid project pausing after 1 week inactivity
- RLS on `decks` ensures users only see their own decks — no manual filtering needed in repository
- Card catalog is cached in memory after first load per session (no repeated network calls)
- The `server/` Dart Frog code is NOT deleted — kept as reference for any future custom server logic
- ~4 new cards every 2 weeks: add via `INSERT` in Supabase SQL Editor + upload image to Storage bucket
