class Deck {
  final String id;
  final String name;
  final String description;
  final List<String> cardIds;
  final bool isPublic;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Deck({
    required this.id,
    required this.name,
    this.description = '',
    required this.cardIds,
    this.isPublic = false,
    required this.createdAt,
    this.updatedAt,
  });

  Deck copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? cardIds,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Deck(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      cardIds: cardIds ?? this.cardIds,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      cardIds: List<String>.from(json['card_ids'] as List),
      isPublic: json['is_public'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'card_ids': cardIds,
        'is_public': isPublic,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
