import 'dart:convert';

class AuthorModel {
  final String name;
  final int? bookCount;
  final String? picture;
  AuthorModel({
    required this.name,
    this.bookCount,
    this.picture,
  });

  AuthorModel copyWith({
    String? name,
    int? bookCount,
    String? picture,
  }) {
    return AuthorModel(
      name: name ?? this.name,
      bookCount: bookCount ?? this.bookCount,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
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
      bookCount: map['bookCount']?.toInt(),
      picture: map['picture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthorModel(name: $name, bookCount: $bookCount, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorModel &&
        other.name == name &&
        other.bookCount == bookCount &&
        other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ bookCount.hashCode ^ picture.hashCode;
}
