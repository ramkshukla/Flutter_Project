import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieDTO {
  final int id;
  final String title;
  final String originalTitle;
  final String posterImage;
  final String overview;
  final List<int> genreIds;
  final num rating;
  final String date;

  MovieDTO({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.posterImage,
    required this.overview,
    required this.genreIds,
    required this.rating,
    required this.date,
  });

  MovieDTO copyWith({
    int? id,
    String? title,
    String? originalTitle,
    String? posterImage,
    String? overview,
    List<int>? genreIds,
    num? rating,
    String? date,
  }) {
    return MovieDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      posterImage: posterImage ?? this.posterImage,
      overview: overview ?? this.overview,
      genreIds: genreIds ?? this.genreIds,
      rating: rating ?? this.rating,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'poster_path': posterImage,
      'overview': overview,
      'genre_ids': genreIds,
      'vote_average': rating,
      'release_date': date,
    };
  }

  factory MovieDTO.fromMap(Map<String, dynamic> map) {
    return MovieDTO(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      posterImage: map['poster_path'] ?? '',
      overview: map['overview'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      rating: map['vote_average'] ?? 0,
      date: map['release_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDTO.fromJson(String source) =>
      MovieDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDTO(id: $id, title: $title, originalTitle: $originalTitle, posterImage: $posterImage, overview: $overview, genreIds: $genreIds, rating: $rating, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDTO &&
        other.id == id &&
        other.title == title &&
        other.originalTitle == originalTitle &&
        other.posterImage == posterImage &&
        other.overview == overview &&
        listEquals(other.genreIds, genreIds) &&
        other.rating == rating &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        originalTitle.hashCode ^
        posterImage.hashCode ^
        overview.hashCode ^
        genreIds.hashCode ^
        rating.hashCode ^
        date.hashCode;
  }
}
