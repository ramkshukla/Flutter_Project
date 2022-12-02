import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDTO {
  String? id;
  final String title;
  final String description;
  final Timestamp created_at;

  TodoDTO({
    required this.title,
    required this.description,
    required this.created_at,
    this.id,
  });

  TodoDTO copyWith({
    String? id,
    String? title,
    String? description,
    Timestamp? created_at,
  }) {
    return TodoDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'created_at': created_at,
    };
  }

  factory TodoDTO.fromMap(Map<String, dynamic> map) {
    return TodoDTO(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      description: map['description'] as String,
      created_at: Timestamp.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoDTO.fromJson(Map<String, dynamic> json) => TodoDTO(
      title: json['title'] as String,
      description: json['description'] as String,
      created_at: json['created_at'] as Timestamp);

  @override
  String toString() {
    return 'TodoDTO(id: $id, title: $title, description: $description, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant TodoDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        created_at.hashCode;
  }
}
