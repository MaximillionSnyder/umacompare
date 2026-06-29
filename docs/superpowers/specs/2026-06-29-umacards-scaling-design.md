# UmaCards: Escalar a 200+ Cartas

Fecha: 2026-06-29
Estado: Aprobado

## Problema

La app carga todo el catálogo de cartas desde un JSON embebido con imágenes locales. Con 200+ cartas, el build web crece desproporcionadamente y la carga inicial se vuelve lenta.

## Objetivos

- Soportar 200+ cartas sin degradación de rendimiento
- Separación clara de datos y UI
- Fácil migración de pre-producción a producción
- Código mínimo para pre-prod, sin over-engineering

## Arquitectura

### Repository Pattern

CardRepository (abstract)
├── LocalCardRepository    ← pre-prod (lee JSON embebido)
└── ApiCardRepository      ← prod (llama al backend Dart Frog)

Se inyecta via Riverpod: `cardRepositoryProvider` expone la impl activa.
La migración solo requiere cambiar el provider, el frontend no se modifica.

```
UI (Catalog, DeckBuilder, etc.)
        │
        ▼
 CardRepository (abstract)
        │
        ├── getAll()
        ├── getById(String id)
        ├── getFiltered({type, rarity, query})
        └── search(String query)
```

### Imágenes

- Pre-prod: `build/web/assets/images/cards/{nombre}.png`, servidas por HTTP server
- Prod: CDN (Cloudinary, Imgix) o backend Dart Frog
- En datos: ruta relativa (`cards/kitasan_black.png`)
- Repo expone `imageBaseUrl(String path)` que resuelve la URL completa según impl

### Catálogo Virtualizado

- `ListView.builder` con items ~80px → solo renderiza ~10-15 cartas visibles
- Imágenes lazy-load via `cached_network_image` (ya incluido en pubspec)
- Scroll infinito o paginación de 50 en 50
- JSON de 200 cartas ≈ 200KB → se carga completo sin problema

### Estado Riverpod

```
cardListProvider        → FutureProvider<List<CardData>>
catalogFilterProvider   → StateProvider<CatalogFilter>
filteredCardsProvider   → Provider<List<CardData>> (derivado)
```

- `CardData`: clase plana separada de `SupportCard` (solo datos, sin lógica UI)
- DeckBuilder reusa el catálogo virtualizado

### Auth & Decks

| Capa | Pre-prod | Prod |
|------|----------|------|
| Auth | Mock (SharedPrefs) | JWT backend Dart Frog |
| Decks | SharedPreferences | API REST backend |
| DeckRepository | LocalDeckRepository | ApiDeckRepository |

### Migración a Producción

Pasos:
1. Mover JSON de cartas a SQLite en backend Dart Frog
2. Subir imágenes a CDN
3. Cambiar `cardRepositoryProvider` de `LocalCardRepository` a `ApiCardRepository`
4. Cambiar `deckRepositoryProvider` y `authProvider` a impls remotas
5. Eliminar impls locales (o mantenerlas como fallback offline)

## Cards JSON (pre-prod)

El `assets/cards.json` actual se mantiene con el mismo schema. Las rutas de imagen cambian de `assets/images/cards/{id}.png` a `cards/{id}.png` (relativas) para que el repo pueda resolver la URL base.

## Pendientes para implementación

1. Refactorizar `SupportCard` a `CardData` (datos) + wrapper de UI
2. Crear `CardRepository` abstracto y `LocalCardRepository`
3. Crear `DeckRepository` abstracto y `LocalDeckRepository`
4. Reorganizar providers con Riverpod
5. Virtualizar catálogo con `ListView.builder`
6. Migrar imágenes a rutas relativas
7. Agregar 200+ cartas al JSON
8. Copiar imágenes a `build/web/assets/images/cards/`
