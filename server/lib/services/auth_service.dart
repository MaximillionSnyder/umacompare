import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:bcrypt/bcrypt.dart';

const _jwtSecret = 'uma-cards-secret-key-change-in-production';
const _jwtExpiryHours = 72;

class AuthService {
  String hashPassword(String password) =>
      BCrypt.hashpw(password, BCrypt.gensalt());

  bool verifyPassword(String password, String hash) =>
      BCrypt.checkpw(password, hash);

  String generateToken(String userId, String username) {
    final jwt = JWT({
      'sub': userId,
      'username': username,
      'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000,
    });
    return jwt.sign(
      SecretKey(_jwtSecret),
      expiresIn: Duration(hours: _jwtExpiryHours),
    );
  }

  JWT? verifyToken(String token) {
    try {
      return JWT.verify(token, SecretKey(_jwtSecret));
    } catch (_) {
      return null;
    }
  }
}
