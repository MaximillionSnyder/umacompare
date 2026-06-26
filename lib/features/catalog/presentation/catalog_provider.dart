import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cards_repository.dart';
import '../domain/support_card_model.dart';

final cardsRepoProvider = Provider<CardsRepository>((ref) => CardsRepository());

final cardsProvider = FutureProvider<List<SupportCard>>((ref) async {
  return ref.read(cardsRepoProvider).loadCards();
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
  final repo = ref.read(cardsRepoProvider);
  return repo.filter(
    cards: cards,
    types: filters.types,
    rarities: filters.rarities,
    search: filters.search,
  );
});
