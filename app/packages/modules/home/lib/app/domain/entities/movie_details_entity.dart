import 'dart:convert';

class MovieDetailsEntity {
  MovieDetailsEntity({
    required this.genre,
    required this.runtime,
  });

  factory MovieDetailsEntity.fromJson(String source) =>
      MovieDetailsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  factory MovieDetailsEntity.fromMap(Map<String, dynamic> map) {
    return MovieDetailsEntity(
      genre: List<String>.from(
        (map['genres'] as List<Map<String, String>>).map((e) => e.values),
      ),
      runtime: map['runtime'] as int,
    );
  }

  final List<String> genre;
  final int runtime;
}
