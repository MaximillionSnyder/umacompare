# AGENTS.md — UmaCards

## Quick start
- Flutter SDK: `C:\flutter\bin\flutter.bat` (not in PATH)
- Git: `C:\flutter\bin\mingit\cmd\git.exe`
- Analyze: `flutter analyze lib/` (excludes `server/`)
- Build web: `flutter build web`
- Serve (pre-prod): `python -m http.server 8080 -d build/web` or run `serve_uma_cards.bat`
- No test files exist yet

## Card rarity (SSR / SR / R)
- Rarity is a required field in `assets/cards.json`: `"ssr"`, `"sr"`, or `"r"`
- Visual differentiation in `lib/shared/widgets/rarity_badge.dart`:
  - SSR=gold (#F59E0B, 5 stars)
  - SR=purple (#A855F7, 3 stars)
  - R=gray (#9CA3AF, 1 star)
- Filterable by rarity in `FilterBar` (`lib/shared/widgets/filter_bar.dart`)
- Rarity colors defined in `UmaColors` (`lib/core/theme/uma_colors.dart`)

## Card data
- `assets/cards.json`: 200 entries, image paths relative (`cards/name.png`)
- Model: `lib/features/catalog/domain/support_card_model.dart` (fromJson/toJson)
- Image URLs resolved by `CardRepository.imageUrl()` → defaults to `http://localhost:8080/assets/images/`
- Place images in `assets/images/cards/` (build) or `build/web/assets/images/cards/` (direct serve)
- New cards must have realistic Umamusume character names, cover all 6 types and 3 rarities

## Architecture
- Repository pattern: `CardRepository` + `DeckRepository` (abstract in `lib/core/repositories/`)
- `LocalCardRepository` → loads from JSON (pre-prod), swap for API in prod
- `LocalDeckRepository` → persists to SharedPreferences
- State: Riverpod via `flutter_riverpod` — providers in `lib/core/providers/`
- Routing: GoRouter in `lib/app.dart` defines all routes
- Theme: dark gaming in `lib/core/theme/uma_colors.dart` (per-type colors: speed=blue, stamina=red, etc.)
- Screens follow `lib/features/{feature}/presentation/` convention
- Images load via `CachedNetworkImage` (see `lib/shared/widgets/uma_card_widget.dart`)

## Backend (Dart Frog)
- Lives in `server/` directory — not wired to frontend yet
- Start: `cd server && dart pub get && dart_frog dev`
- Endpoints: auth (JWT) + decks CRUD
- Analyzer excludes `server/` by default

## Common operations
```bash
# Full analyze
C:\flutter\bin\flutter.bat analyze lib/

# Build
C:\flutter\bin\flutter.bat build web

# Serve
taskkill /F /FI "WindowTitle eq Uma Cards Server" 2>$null
Start-Process -WindowStyle Normal -FilePath "serve_uma_cards.bat"
```

## Constraints
- No PWA — Flutter web only (targeting web + Android)
- All 3 rarities (SSR, SR, R) must be visually distinct and filterable
- Pre-prod uses local JSON + HTTP server; prod should migrate to repository API implementations
