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
