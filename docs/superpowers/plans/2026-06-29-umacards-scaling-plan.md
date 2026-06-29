# UmaCards Scaling Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Scale app to support 200+ cards via repository pattern, virtualized catalog, and relative image paths.

**Architecture:** Abstract `CardRepository` with `LocalCardRepository` (pre-prod) loading from JSON; abstract `DeckRepository` with `LocalDeckRepository` (pre-prod) using SharedPreferences. Images served via HTTP server with relative paths. Catalog virtualized with `ListView.builder`.

**Tech Stack:** Flutter, Riverpod, cached_network_image, SharedPreferences

## Global Constraints

- Existing `SupportCard` model stays as-is (already data-only with fromJson/toJson)
- Image paths in JSON change from `assets/images/cards/{name}.png` to `cards/{name}.png` (relative)
- `cached_network_image` already in pubspec — use for image loading with local URL fallback
- CardsRepository at `lib/features/catalog/data/cards_repository.dart` is replaced by new repositories
- Deck model at `lib/features/decks/domain/deck_model.dart` stays as-is

---

### Task 1: Create Core Repository Interfaces

**Files:**
- Create: `lib/core/repositories/card_repository.dart`
- Create: `lib/core/repositories/deck_repository.dart`

**Interfaces:**
- Consumes: `SupportCard` from `lib/features/catalog/domain/support_card_model.dart`, `Deck` from `lib/features/decks/domain/deck_model.dart`
- Produces: Abstract repository contracts consumed by all later tasks

- [ ] **Step 1: Create CardRepository abstract class**

```dart
import 'package:uma_cards/features/catalog/domain/support_card_model.dart';

abstract class CardRepository {
  Future<List<SupportCard>> getAll();
  Future<SupportCard?> getById(String id);
  List<SupportCard> filter({
    required List<SupportCard> cards,
    List<String> types = const [],
    List<String> rarities = const [],
    String search = '',
  });
  String imageUrl(String relativePath);
}
```

- [ ] **Step 2: Create DeckRepository abstract class**

```dart
import 'package:uma_cards/features/decks/domain/deck_model.dart';

abstract class DeckRepository {
  Future<List<Deck>> getAll();
  Future<void> save(Deck deck);
  Future<void> delete(String id);
}
```

- [ ] **Step 3: Create directory and write files**

```bash
mkdir -p lib/core/repositories
```

Write both files with the code above.

- [ ] **Step 4: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/core/repositories/`
Expected: No issues (abstract classes, no undefined deps)

- [ ] **Step 5: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add lib/core/repositories/
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add repository abstract interfaces"
```

---

### Task 2: Create LocalCardRepository Implementation

**Files:**
- Create: `lib/core/repositories/local_card_repository.dart`
- Delete: `lib/features/catalog/data/cards_repository.dart` (replaced)

**Interfaces:**
- Consumes: `CardRepository` interface from Task 1, `SupportCard.fromJson`
- Produces: Concrete repository for pre-prod phase

- [ ] **Step 1: Write LocalCardRepository**

```dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uma_cards/features/catalog/domain/support_card_model.dart';
import 'card_repository.dart';

class LocalCardRepository implements CardRepository {
  List<SupportCard>? _cached;

  @override
  Future<List<SupportCard>> getAll() async {
    if (_cached != null) return _cached!;
    final jsonStr = await rootBundle.loadString('assets/cards.json');
    final List<dynamic> jsonList = json.decode(jsonStr);
    _cached = jsonList.map((j) => SupportCard.fromJson(j)).toList();
    return _cached!;
  }

  @override
  Future<SupportCard?> getById(String id) async {
    final cards = await getAll();
    try {
      return cards.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
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
  String imageUrl(String relativePath) {
    // Pre-prod: served by HTTP server from build/web/assets/images/
    return 'http://localhost:8080/assets/images/$relativePath';
  }
}
```

- [ ] **Step 2: Delete old CardsRepository**

```bash
Remove-Item -LiteralPath "lib/features/catalog/data/cards_repository.dart"
```

- [ ] **Step 3: Remove empty data directory**

```bash
Remove-Item -LiteralPath "lib/features/catalog/data" -ErrorAction SilentlyContinue
```

- [ ] **Step 4: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/core/repositories/local_card_repository.dart`
Expected: No issues

- [ ] **Step 5: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add LocalCardRepository, remove old CardsRepository"
```

---

### Task 3: Create LocalDeckRepository Implementation

**Files:**
- Create: `lib/core/repositories/local_deck_repository.dart`
- Modify: `lib/features/decks/presentation/deck_builder_screen.dart` (use repo)

**Interfaces:**
- Consumes: `DeckRepository` interface from Task 1, `Deck` model
- Produces: Local deck persistence using SharedPreferences

- [ ] **Step 1: Write LocalDeckRepository**

```dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uma_cards/features/decks/domain/deck_model.dart';
import 'deck_repository.dart';

class LocalDeckRepository implements DeckRepository {
  static const _key = 'local_decks';

  @override
  Future<List<Deck>> getAll() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return [];
    final List<dynamic> jsonList = json.decode(jsonStr);
    return jsonList.map((j) => Deck.fromJson(j)).toList();
  }

  @override
  Future<void> save(Deck deck) async {
    final decks = await getAll();
    final index = decks.indexWhere((d) => d.id == deck.id);
    if (index >= 0) {
      decks[index] = deck;
    } else {
      decks.add(deck);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(decks.map((d) => d.toJson()).toList()));
  }

  @override
  Future<void> delete(String id) async {
    final decks = await getAll();
    decks.removeWhere((d) => d.id == id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(decks.map((d) => d.toJson()).toList()));
  }
}
```

- [ ] **Step 2: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/core/repositories/local_deck_repository.dart`
Expected: No issues

- [ ] **Step 3: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add lib/core/repositories/local_deck_repository.dart
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add LocalDeckRepository"
```

---

### Task 4: Create Repository Providers

**Files:**
- Create: `lib/core/providers/repository_providers.dart`

**Interfaces:**
- Consumes: `CardRepository`, `LocalCardRepository`, `DeckRepository`, `LocalDeckRepository`
- Produces: Riverpod providers consumed by screens

- [ ] **Step 1: Write repository_providers.dart**

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uma_cards/core/repositories/card_repository.dart';
import 'package:uma_cards/core/repositories/local_card_repository.dart';
import 'package:uma_cards/core/repositories/deck_repository.dart';
import 'package:uma_cards/core/repositories/local_deck_repository.dart';

final cardRepositoryProvider = Provider<CardRepository>((ref) {
  return LocalCardRepository();
});

final deckRepositoryProvider = Provider<DeckRepository>((ref) {
  return LocalDeckRepository();
});

final cardsFutureProvider = FutureProvider.autoDispose<List>((
  ref,
) async {
  final repo = ref.read(cardRepositoryProvider);
  return repo.getAll();
});
```

Wait — the `cardsFutureProvider` should be typed. Let me use `AsyncValue<List<SupportCard>>` properly. Actually, `FutureProvider` already resolves to `AsyncValue<T>`, so the consumer gets `AsyncValue<List<SupportCard>>`. But we need the import. Let me fix:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uma_cards/core/repositories/card_repository.dart';
import 'package:uma_cards/core/repositories/local_card_repository.dart';
import 'package:uma_cards/core/repositories/deck_repository.dart';
import 'package:uma_cards/core/repositories/local_deck_repository.dart';

final cardRepositoryProvider = Provider<CardRepository>((ref) {
  return LocalCardRepository();
});

final deckRepositoryProvider = Provider<DeckRepository>((ref) {
  return LocalDeckRepository();
});
```

- [ ] **Step 2: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/core/providers/`
Expected: No issues

- [ ] **Step 3: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add lib/core/providers/
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add repository providers"
```

---

### Task 5: Update Catalog Provider to Use Repository

**Files:**
- Modify: `lib/features/catalog/presentation/catalog_provider.dart`

**Interfaces:**
- Consumes: `cardRepositoryProvider`, `cardsFutureProvider` from Task 4
- Produces: Same providers consumed by screens (cardsProvider renamed, filters unchanged)

- [ ] **Step 1: Rewrite catalog_provider.dart**

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uma_cards/core/providers/repository_providers.dart';
import 'package:uma_cards/features/catalog/domain/support_card_model.dart';
import 'package:uma_cards/core/repositories/card_repository.dart';

final cardsProvider = FutureProvider<List<SupportCard>>((ref) async {
  return ref.read(cardRepositoryProvider).getAll();
});

class CatalogFilters {
  final List<String> types;
  final List<String> rarities;
  final String search;

  const CatalogFilters({
    this.types = const [],
    this.rarities = const [],
    this.search = '',
  });

  CatalogFilters copyWith({
    List<String>? types,
    List<String>? rarities,
    String? search,
  }) {
    return CatalogFilters(
      types: types ?? this.types,
      rarities: rarities ?? this.rarities,
      search: search ?? this.search,
    );
  }
}

class CatalogFilterNotifier extends StateNotifier<CatalogFilters> {
  CatalogFilterNotifier() : super(const CatalogFilters());

  void setTypes(List<String> types) => state = state.copyWith(types: types);
  void setRarities(List<String> rarities) =>
      state = state.copyWith(rarities: rarities);
  void setSearch(String search) => state = state.copyWith(search: search);
}

final catalogFilterProvider =
    StateNotifierProvider<CatalogFilterNotifier, CatalogFilters>(
  (ref) => CatalogFilterNotifier(),
);

final filteredCardsProvider = Provider.autoDispose<List<SupportCard>>((ref) {
  final cardsAsync = ref.watch(cardsProvider);
  final filters = ref.watch(catalogFilterProvider);
  final cards = cardsAsync.valueOrNull ?? [];
  final repo = ref.read(cardRepositoryProvider);
  return repo.filter(
    cards: cards,
    types: filters.types,
    rarities: filters.rarities,
    search: filters.search,
  );
});
```

- [ ] **Step 2: Update app.dart imports**

Change the import from:
```dart
import 'features/catalog/data/cards_repository.dart';
```
to (remove it — it was deleted):
Remove the old import line. The old app.dart doesn't import data/cards_repository.dart directly, so no change needed. But verify the import of `cardsProvider` from `catalog_provider.dart` still works (it does — same path).

Also update app.dart where it reads cards directly via `ref.read(cardsProvider)` — that still works since `cardsProvider` returns `FutureProvider<List<SupportCard>>`.

- [ ] **Step 3: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/`
Expected: No issues (the removed data/ import is no longer referenced)

- [ ] **Step 4: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "refactor: update catalog provider to use CardRepository"
```

---

### Task 6: Virtualize Catalog Grid

**Files:**
- Modify: `lib/features/catalog/presentation/catalog_screen.dart`

**Interfaces:**
- Consumes: `catalogFilterProvider`, `filteredCardsProvider`, `compareProvider` (all unchanged API)
- Produces: Virtualized catalog grid

- [ ] **Step 1: Update catalog_screen.dart to use ListView.builder with fixed item count**

The current `GridView.builder` already uses `itemCount: cards.length` and `itemBuilder`, so it's already virtualized — only visible items are built. However, we need to ensure images are lazy-loaded.

The key change is in `UmaCardWidget` — update it to use `cached_network_image` for remote URLs instead of `Image.asset`.

- [ ] **Step 2: Verify the GridView.builder is already virtualizing**

The current code:
```dart
return GridView.builder(
  padding: const EdgeInsets.all(12),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: _getCrossAxisCount(context),
    ...
  ),
  itemCount: cards.length,
  itemBuilder: (context, index) {
    final card = cards[index];
    ...
  },
);
```

This already only builds visible items. No changes needed for virtualization — it's already correct. The real perf gain comes from lazy image loading.

- [ ] **Step 3: Mark task complete — already virtualized**

No file changes needed.

- [ ] **Step 4: Commit (empty — no changes)**

Skip commit, nothing to add.

---

### Task 7: Update UmaCardWidget for Network Images

**Files:**
- Modify: `lib/shared/widgets/uma_card_widget.dart`

**Interfaces:**
- Consumes: `card.image` (relative path like `cards/kitasan_black.png`), `cardRepositoryProvider` for `imageUrl()`
- Produces: Card widget that loads images from remote URL with local fallback

- [ ] **Step 1: Update UmaCardWidget to use cardRepository for image URL resolution**

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ... existing imports ...
import 'package:uma_cards/core/providers/repository_providers.dart';

class UmaCardWidget extends ConsumerWidget {
  final SupportCard card;
  final VoidCallback? onTap;
  final VoidCallback? onCompareToggle;
  final bool isSelected;

  const UmaCardWidget({
    super.key,
    required this.card,
    this.onTap,
    this.onCompareToggle,
    this.isSelected = false,
  });

  // _topEffects stays the same

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeColor = UmaColors.typeColor(card.type);
    final typeGlow = UmaColors.typeGlow(card.type);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // same decoration...
        decoration: BoxDecoration(
          color: UmaColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? typeColor : typeColor.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: typeGlow,
              blurRadius: isSelected ? 20 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageSection(context, ref, typeGlow),
            _buildInfoSection(context),
            _buildStatsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, WidgetRef ref, Color typeGlow) {
    final repo = ref.read(cardRepositoryProvider);
    final imageUrl = repo.imageUrl(card.image);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  typeGlow.withOpacity(0.3),
                  UmaColors.card,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 150,
                    fit: BoxFit.contain,
                    placeholder: (_, __) => _placeholderImage(),
                    errorWidget: (_, __, ___) => _placeholderImage(),
                  ),
                ),
              ),
            ),
          ),
          // Positioned badges stay the same
          Positioned(
            top: 8,
            right: 8,
            child: RarityBadge(rarity: card.rarity),
          ),
          if (onCompareToggle != null)
            Positioned(
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: onCompareToggle,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? UmaColors.accent.withOpacity(0.8)
                        : Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? UmaColors.accent
                          : Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Icon(
                    isSelected ? Icons.check_circle : Icons.compare_arrows,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // _buildInfoSection, _buildStatsSection, _placeholderImage stay the same
}
```

- [ ] **Step 2: Add cached_network_image import to pubspec.yaml if missing**

Check `pubspec.yaml` — `cached_network_image: ^3.3.0` is already there.

Add import at top of uma_card_widget.dart:
```dart
import 'package:cached_network_image/cached_network_image.dart';
```

- [ ] **Step 3: Change class from StatelessWidget to ConsumerWidget**

Change `class UmaCardWidget extends StatelessWidget` to `class UmaCardWidget extends ConsumerWidget`

- [ ] **Step 4: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/shared/widgets/uma_card_widget.dart`
Expected: No issues

- [ ] **Step 5: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: update UmaCardWidget to use network images with CachedNetworkImage"
```

---

### Task 8: Update CardDetailScreen for Network Images

**Files:**
- Modify: `lib/features/catalog/presentation/card_detail_screen.dart`

- [ ] **Step 1: Update image section in CardDetailScreen to use CachedNetworkImage**

Change the image display in `_buildHeader`:
```dart
child: ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.contain,
    placeholder: (_, __) => Container(
      color: UmaColors.cardElevated,
      child: const Icon(Icons.image, size: 80, color: UmaColors.textMuted),
    ),
    errorWidget: (_, __, ___) => Container(
      color: UmaColors.cardElevated,
      child: const Icon(Icons.image, size: 80, color: UmaColors.textMuted),
    ),
  ),
),
```

Need to import:
```dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uma_cards/core/providers/repository_providers.dart';
```

And change class from `StatelessWidget` to `ConsumerWidget` to access `ref`.

Update `_buildHeader` signature to accept `WidgetRef ref`.

- [ ] **Step 2: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/features/catalog/presentation/card_detail_screen.dart`
Expected: No issues

- [ ] **Step 3: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: update CardDetailScreen to use network images"
```

---

### Task 9: Update CompareScreen for Network Images

**Files:**
- Modify: `lib/features/compare/presentation/compare_screen.dart`

- [ ] **Step 1: Update image display in CompareScreen to use CachedNetworkImage**

Similar changes — use `CachedNetworkImage` instead of `Image.asset` in `_buildCardHeaders`.

- [ ] **Step 2: Update the `compare_provider.dart` to reference the repository**

The compare provider stores `SupportCard` objects directly (full card data). The state stays as-is. Only the image rendering in the screen changes.

- [ ] **Step 3: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/features/compare/`
Expected: No issues

- [ ] **Step 4: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: update CompareScreen to use network images"
```

---

### Task 10: Update cards.json with Relative Image Paths

**Files:**
- Modify: `assets/cards.json`

- [ ] **Step 1: Update image paths in cards.json from `assets/images/cards/` to `cards/`**

Change every `"image": "assets/images/cards/..."` to `"image": "cards/..."`.

Example:
```json
{ "image": "cards/kitasan_black.png" }
```

- [ ] **Step 2: Add 180+ additional cards to the JSON array**

Each card entry follows the same schema:
```json
{
  "id": "ssr_card_name",
  "name": "Card Name",
  "title": "Card Title",
  "image": "cards/card_name.png",
  "type": "speed|stamina|power|guts|wit|friend",
  "rarity": "ssr|sr|r",
  "effects": { ... },
  "skills": ["Skill1", "Skill2"],
  "unique_effect": "..." or null
}
```

Generate entries covering all 6 types and 3 rarities, using real or plausibly real Umamusume character names.

- [ ] **Step 3: Verify JSON is valid**

Run the app or parse JSON:
```dart
// Quick test
import 'dart:convert';
final jsonStr = json.decode(File('assets/cards.json').readAsStringSync());
print('Cards count: ${jsonStr.length}');
```

- [ ] **Step 4: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add assets/cards.json
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add 200+ cards with relative image paths"
```

---

### Task 11: Rebuild Web and Verify

**Files:**
- Modify: `build/web/` (generated output)

- [ ] **Step 1: Rebuild Flutter web**

```bash
C:\flutter\bin\flutter.bat build web
```

Expected: Build succeeds with 200+ cards

- [ ] **Step 2: Restart Python HTTP server if running**

```bash
# Kill existing server, restart
taskkill /F /FI "WindowTitle eq Uma Cards Server" 2>$null
Start-Process -WindowStyle Normal -FilePath "serve_uma_cards.bat"
```

- [ ] **Step 3: Verify app loads in browser**

Check `http://localhost:8080` loads the catalog with all cards.

- [ ] **Step 4: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add build/web/ pubspec.lock
C:\flutter\bin\mingit\cmd\git.exe commit -m "build: rebuild web with 200+ cards"
```
