import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../catalog/domain/support_card_model.dart';

class CompareState {
  final List<SupportCard> selectedCards;
  final int maxCompare;

  const CompareState({
    this.selectedCards = const [],
    this.maxCompare = 6,
  });

  CompareState copyWith({List<SupportCard>? selectedCards, int? maxCompare}) {
    return CompareState(
      selectedCards: selectedCards ?? this.selectedCards,
      maxCompare: maxCompare ?? this.maxCompare,
    );
  }
}

class CompareNotifier extends StateNotifier<CompareState> {
  CompareNotifier() : super(const CompareState());

  void toggleCard(SupportCard card) {
    final current = List<SupportCard>.from(state.selectedCards);
    final index = current.indexWhere((c) => c.id == card.id);
    if (index >= 0) {
      current.removeAt(index);
    } else if (current.length < state.maxCompare) {
      current.add(card);
    }
    state = state.copyWith(selectedCards: current);
  }

  void removeCard(String cardId) {
    final current = List<SupportCard>.from(state.selectedCards);
    current.removeWhere((c) => c.id == cardId);
    state = state.copyWith(selectedCards: current);
  }

  void clearAll() => state = state.copyWith(selectedCards: []);
}

final compareProvider =
    StateNotifierProvider<CompareNotifier, CompareState>(
  (ref) => CompareNotifier(),
);

final selectedCompareCardsProvider =
    Provider<List<SupportCard>>((ref) {
  return ref.watch(compareProvider).selectedCards;
});
