import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:moveoapp/home/model/genre_dto.dart';

class MovieDetailDTO {
  final int id;
  final String title;
  final String originalTitle;
  final String posterImage;
  final String overview;
  final List<GenreDTO> genres;
  final num rating;
  final String date;

  MovieDetailDTO({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.posterImage,
    required this.overview,
    required this.genres,
    required this.rating,
    required this.date,
  });

  factory MovieDetailDTO.initial() => MovieDetailDTO(
        id: 0,
        title: "",
        originalTitle: "",
        posterImage: "",
        overview: "",
        genres: [],
        rating: 0,
        date: "",
      );

  MovieDetailDTO copyWith({
    int? id,
    String? title,
    String? originalTitle,
    String? posterImage,
    String? overview,
    List<GenreDTO>? genres,
    num? rating,
    String? date,
  }) {
    return MovieDetailDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      posterImage: posterImage ?? this.posterImage,
      overview: overview ?? this.overview,
      genres: genres ?? this.genres,
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
      'genres': genres.map((x) => x.toMap()).toList(),
      'vote_average': rating,
      'release_date': date,
    };
  }

  factory MovieDetailDTO.fromMap(Map<String, dynamic> map) {
    return MovieDetailDTO(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      posterImage: map['poster_path'] ?? '',
      overview: map['overview'] ?? '',
      genres:
          List<GenreDTO>.from(map['genres']?.map((x) => GenreDTO.fromMap(x))),
      rating: map['vote_average'] ?? 0,
      date: map['release_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailDTO.fromJson(String source) =>
      MovieDetailDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDetailDTO(id: $id, title: $title, originalTitle: $originalTitle, posterImage: $posterImage, overview: $overview, genres: $genres, rating: $rating, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetailDTO &&
        other.id == id &&
        other.title == title &&
        other.originalTitle == originalTitle &&
        other.posterImage == posterImage &&
        other.overview == overview &&
        listEquals(other.genres, genres) &&
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
        genres.hashCode ^
        rating.hashCode ^
        date.hashCode;
  }
}
