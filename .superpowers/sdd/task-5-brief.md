### Task 5: Update Catalog Provider to Use Repository

**Files:**
- Modify: `lib/features/catalog/presentation/catalog_provider.dart`

**Interfaces:**
- Consumes: `cardRepositoryProvider` from Task 4
- Produces: Same providers consumed by screens (cardsProvider, filters unchanged)

- [ ] **Step 1: Rewrite catalog_provider.dart**

Replace the entire file content with:

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

- [ ] **Step 2: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/`
Expected: No issues

- [ ] **Step 3: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "refactor: update catalog provider to use CardRepository"
```
