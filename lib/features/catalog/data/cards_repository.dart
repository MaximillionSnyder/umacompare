import 'dart:convert';
import 'package:flutter/services.dart';
import '../../catalog/domain/support_card_model.dart';

class CardsRepository {
  List<SupportCard>? _cached;

  Future<List<SupportCard>> loadCards() async {
    if (_cached != null) return _cached!;
    final jsonStr = await rootBundle.loadString('assets/cards.json');
    final List<dynamic> jsonList = json.decode(jsonStr);
    _cached = jsonList.map((j) => SupportCard.fromJson(j)).toList();
    return _cached!;
  }

  Future<SupportCard?> getById(String id) async {
    final cards = await loadCards();
    try {
      return cards.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

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
}
