class UserModel {
  final String id;
  final String username;
  final String email;
  final String? avatarUrl;
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
