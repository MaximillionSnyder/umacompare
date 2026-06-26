import 'dart:convert';
import 'dart:async';
import 'package:dart_frog/dart_frog.dart';
import 'package:uuid/uuid.dart';
import '../../lib/services/auth_service.dart';

final _authService = AuthService();
const _uuid = Uuid();

final Map<String, Map<String, dynamic>> _users = {};

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  if (method == HttpMethod.post) {
    final path = context.request.uri.path;
    if (path.endsWith('/register')) {
      return _handleRegister(context);
    }
    if (path.endsWith('/login')) {
      return _handleLogin(context);
    }
  }

  return Response.json(
    statusCode: 405,
    body: {'error': 'Method not allowed'},
  );
}

Future<Response> _handleRegister(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final username = body['username'] as String?;
  final email = body['email'] as String?;
  final password = body['password'] as String?;

  if (username == null || email == null || password == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Username, email, and password are required'},
    );
  }

  if (_users.values.any((u) => u['username'] == username)) {
    return Response.json(
      statusCode: 409,
      body: {'error': 'Username already exists'},
    );
  }

  if (_users.values.any((u) => u['email'] == email)) {
    return Response.json(
      statusCode: 409,
      body: {'error': 'Email already registered'},
    );
  }

  final userId = _uuid.v4();
  final hashedPassword = _authService.hashPassword(password);

  _users[userId] = {
    'id': userId,
    'username': username,
    'email': email,
    'password_hash': hashedPassword,
    'created_at': DateTime.now().toIso8601String(),
  };

  final token = _authService.generateToken(userId, username);

  return Response.json(
    statusCode: 201,
    body: {
      'token': token,
      'user': {
        'id': userId,
        'username': username,
        'email': email,
        'created_at': _users[userId]!['created_at'],
      },
    },
  );
}

Future<Response> _handleLogin(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final username = body['username'] as String?;
  final password = body['password'] as String?;

  if (username == null || password == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Username and password are required'},
    );
  }

  final userEntry =
      _users.entries.firstWhere(
    (e) => e.value['username'] == username,
    orElse: () => MapEntry('', {}),
  );

  if (userEntry.key.isEmpty) {
    return Response.json(
      statusCode: 401,
      body: {'error': 'Invalid username or password'},
    );
  }

  final user = userEntry.value;
  if (!_authService.verifyPassword(password, user['password_hash'] as String)) {
    return Response.json(
      statusCode: 401,
      body: {'error': 'Invalid username or password'},
    );
  }

  final token = _authService.generateToken(userEntry.key, username);

  return Response.json(
    body: {
      'token': token,
      'user': {
        'id': user['id'],
        'username': user['username'],
        'email': user['email'],
        'created_at': user['created_at'],
      },
    },
  );
}
