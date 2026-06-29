import 'package:uma_cards/features/decks/domain/deck_model.dart';

abstract class DeckRepository {
  Future<List<Deck>> getAll();
  Future<void> save(Deck deck);
  Future<void> delete(String id);
}
