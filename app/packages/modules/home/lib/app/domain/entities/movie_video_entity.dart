import 'dart:convert';

class MovieVideoEntity {
  MovieVideoEntity({
    required this.key,
    required this.name,
    required this.quality,
  });

  factory MovieVideoEntity.fromJson(String source) =>
      MovieVideoEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  factory MovieVideoEntity.fromMap(Map<String, dynamic> map) {
    return MovieVideoEntity(
      key: map['key'] as String,
      name: map['name'] as String,
      quality: map['size'] as int,
    );
  }

  final String key;
  final String name;
  final int quality;
}
