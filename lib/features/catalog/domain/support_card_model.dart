class SupportCard {
  final String id;
  final String name;
  final String title;
  final String image;
  final String type;
  final String rarity;
  final Map<String, int> effects;
  final List<String> skills;
  final String? uniqueEffect;

  const SupportCard({
    required this.id,
    required this.name,
    required this.title,
    required this.image,
    required this.type,
    required this.rarity,
    required this.effects,
    required this.skills,
    this.uniqueEffect,
  });

  factory SupportCard.fromJson(Map<String, dynamic> json) {
    return SupportCard(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      rarity: json['rarity'] as String,
      effects: Map<String, int>.from(
        (json['effects'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, (v as num).toInt()),
        ),
      ),
      skills: List<String>.from(json['skills'] as List),
      uniqueEffect: json['unique_effect'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'image': image,
        'type': type,
        'rarity': rarity,
        'effects': effects,
        'skills': skills,
        'unique_effect': uniqueEffect,
      };
}
