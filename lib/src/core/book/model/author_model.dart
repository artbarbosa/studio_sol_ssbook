import 'dart:convert';

class AuthorModel {
  final String name;
  final String? id;
  final int? bookCount;
  final String? picture;
  AuthorModel({
    required this.name,
    required this.id,
    this.bookCount,
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
      bookCount: bookCount ?? this.bookCount,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    if (id != null) {
      result.addAll({'id': id});
    }
    if (bookCount != null) {
      result.addAll({'bookCount': bookCount});
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
      bookCount: map['bookCount']?.toInt(),
      picture: map['picture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorModel(name: $name, id: $id, bookCount: $bookCount, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorModel &&
        other.name == name &&
        other.id == id &&
        other.bookCount == bookCount &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ bookCount.hashCode ^ picture.hashCode;
  }
}
