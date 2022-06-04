import 'dart:convert';

class AuthorModel {
  final String name;
  final String? id;
  final int? booksCount;
  final String? picture;
  AuthorModel({
    required this.name,
    required this.id,
    this.booksCount,
    this.picture,
  });

  AuthorModel copyWith({
    String? name,
    String? id,
    int? bookCount,
    String? picture,
  }) {
    return AuthorModel(
      name: name ?? this.name,
      id: id ?? this.id,
      booksCount: booksCount ?? this.booksCount,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    if (id != null) {
      result.addAll({'id': id});
    }
    if (booksCount != null) {
      result.addAll({'booksCount': booksCount});
    }
    if (picture != null) {
      result.addAll({'picture': picture});
    }

    return result;
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      name: map['name'] ?? '',
      id: map['id'],
      booksCount: map['booksCount'],
      picture: map['picture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorModel(name: $name, id: $id, booksCount: $booksCount, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorModel &&
        other.name == name &&
        other.id == id &&
        other.booksCount == booksCount &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ booksCount.hashCode ^ picture.hashCode;
  }
}
