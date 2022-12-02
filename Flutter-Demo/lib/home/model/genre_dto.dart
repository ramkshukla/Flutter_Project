import 'dart:convert';

class GenreDTO {
  final int id;
  final String name;

  GenreDTO({
    required this.id,
    required this.name,
  });

  GenreDTO copyWith({
    int? id,
    String? name,
  }) {
    return GenreDTO(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenreDTO.fromMap(Map<String, dynamic> map) {
    return GenreDTO(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreDTO.fromJson(String source) =>
      GenreDTO.fromMap(json.decode(source));

  @override
  String toString() => 'GenreDTO(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenreDTO && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
