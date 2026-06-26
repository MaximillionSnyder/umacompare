import 'dart:async';
import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import '../services/auth_service.dart';

final _authService = AuthService();

Middleware authMiddleware() {
  return (handler) {
    return (context) async {
      if (context.request.method == HttpMethod.options) {
        return handler(context);
      }

      final authHeader = context.request.headers['Authorization'];
      if (authHeader == null || !authHeader.startsWith('Bearer ')) {
        return Response.json(
          statusCode: 401,
          body: {'error': 'Authorization header missing'},
        );
      }

      final token = authHeader.substring(7);
      final jwt = _authService.verifyToken(token);

      if (jwt == null) {
        return Response.json(
          statusCode: 401,
          body: {'error': 'Invalid or expired token'},
        );
      }

      final userId = jwt.payload['sub'] as String;
      final username = jwt.payload['username'] as String;

      final updatedContext = context.provide<Map<String, String>>(
        () => {'userId': userId, 'username': username},
      );

      return handler(updatedContext);
    };
  };
}
