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
