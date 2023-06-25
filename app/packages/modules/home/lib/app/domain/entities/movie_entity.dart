import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class MovieEntity {
  const MovieEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.posterImage,
    required this.coverImage,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory MovieEntity.fromJson(String source) =>
      MovieEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      posterImage: map['posterImage'] as String,
      coverImage: map['coverImage'] as String,
      voteAverage: (map['voteAverage'] as num).toDouble(),
      releaseDate: DateTime.parse(map['releaseDate'] as String),
    );
  }

  final int id;
  final String title;
  final String description;
  final String posterImage;
  final String coverImage;
  final double voteAverage;
  final DateTime releaseDate;

  MovieEntity copyWith({
    int? id,
    String? title,
    String? description,
    String? posterImage,
    String? coverImage,
    double? voteAverage,
    DateTime? releaseDate,
  }) {
    return MovieEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      posterImage: posterImage ?? this.posterImage,
      coverImage: coverImage ?? this.coverImage,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieEntity &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.posterImage == posterImage &&
        other.coverImage == coverImage &&
        other.voteAverage == voteAverage &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        posterImage.hashCode ^
        coverImage.hashCode ^
        voteAverage.hashCode ^
        releaseDate.hashCode;
  }
}
