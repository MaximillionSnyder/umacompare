import 'dart:convert';
import 'dart:async';
import 'package:dart_frog/dart_frog.dart';
import 'package:uuid/uuid.dart';
import '../../lib/middleware/auth_middleware.dart';

const _uuid = Uuid();
final Map<String, Map<String, dynamic>> _decks = {};

Handler middleware(Handler handler) {
  return handler.use(authMiddleware());
}

Future<Response> onRequest(RequestContext context) async {
  final userData = context.read<Map<String, String>>();
  final userId = userData['userId']!;

  final method = context.request.method;

  switch (method) {
    case HttpMethod.get:
      return _listDecks(userId);
    case HttpMethod.post:
      return _createDeck(context, userId);
    case HttpMethod.put:
      return _updateDeck(context, userId);
    case HttpMethod.delete:
      return _deleteDeck(context, userId);
    default:
      return Response.json(
        statusCode: 405,
        body: {'error': 'Method not allowed'},
      );
  }
}

Future<Response> _listDecks(String userId) async {
  final userDecks = _decks.values
      .where((d) => d['user_id'] == userId)
      .map((d) => _sanitize(d))
      .toList();
  return Response.json(body: userDecks);
}

Future<Response> _createDeck(RequestContext context, String userId) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String?;
  final description = body['description'] as String? ?? '';
  final cardIds = body['card_ids'] as List?;

  if (name == null || cardIds == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Name and card_ids are required'},
    );
  }

  final deckId = _uuid.v4();
  final now = DateTime.now().toIso8601String();

  _decks[deckId] = {
    'id': deckId,
    'user_id': userId,
    'name': name,
    'description': description,
    'card_ids': cardIds,
    'is_public': body['is_public'] ?? false,
    'created_at': now,
    'updated_at': now,
  };

  return Response.json(statusCode: 201, body: _sanitize(_decks[deckId]!));
}

Future<Response> _updateDeck(RequestContext context, String userId) async {
  final deckId = context.request.uri.pathSegments.last;
  final deck = _decks[deckId];

  if (deck == null) {
    return Response.json(statusCode: 404, body: {'error': 'Deck not found'});
  }
  if (deck['user_id'] != userId) {
    return Response.json(statusCode: 403, body: {'error': 'Forbidden'});
  }

  final body = await context.request.json() as Map<String, dynamic>;
  if (body.containsKey('name')) deck['name'] = body['name'];
  if (body.containsKey('description')) deck['description'] = body['description'];
  if (body.containsKey('card_ids')) deck['card_ids'] = body['card_ids'];
  if (body.containsKey('is_public')) deck['is_public'] = body['is_public'];
  deck['updated_at'] = DateTime.now().toIso8601String();

  return Response.json(body: _sanitize(deck));
}

Future<Response> _deleteDeck(RequestContext context, String userId) async {
  final deckId = context.request.uri.pathSegments.last;
  final deck = _decks[deckId];

  if (deck == null) {
    return Response.json(statusCode: 404, body: {'error': 'Deck not found'});
  }
  if (deck['user_id'] != userId) {
    return Response.json(statusCode: 403, body: {'error': 'Forbidden'});
  }

  _decks.remove(deckId);
  return Response.json(body: {'message': 'Deck deleted'});
}

Map<String, dynamic> _sanitize(Map<String, dynamic> deck) {
  return {
    'id': deck['id'],
    'name': deck['name'],
    'description': deck['description'],
    'card_ids': deck['card_ids'],
    'is_public': deck['is_public'],
    'created_at': deck['created_at'],
    'updated_at': deck['updated_at'],
  };
}
