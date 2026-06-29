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
