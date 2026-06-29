import 'package:uma_cards/features/catalog/domain/support_card_model.dart';

abstract class CardRepository {
  Future<List<SupportCard>> getAll();
  Future<SupportCard?> getById(String id);
  List<SupportCard> filter({
    required List<SupportCard> cards,
    List<String> types = const [],
    List<String> rarities = const [],
    String search = '',
  });
  String imageUrl(String relativePath);
}
