import 'dart:convert';

import 'author_model.dart';

class BookModel {
  final String id;
  final String cover;
  final String? name;
  final AuthorModel? author;
  final String? description;
  final bool? isFavorite;
  BookModel({
    required this.id,
    this.name,
    this.author,
    required this.cover,
    this.description,
    this.isFavorite,
  });

  BookModel copyWith({
    String? id,
    String? name,
    AuthorModel? author,
    String? cover,
    String? description,
    bool? isFavorite,
  }) {
    return BookModel(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      cover: cover ?? this.cover,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (name != null) {
      result.addAll({'name': name});
    }
    if (author != null) {
      result.addAll({'author': author!.toMap()});
    }
    result.addAll({'cover': cover});
    if (description != null) {
      result.addAll({'description': description});
    }
    if (isFavorite != null) {
      result.addAll({'isFavorite': isFavorite});
    }

    return result;
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? '',
      name: map['name'],
      author: map['author'] != null ? AuthorModel.fromMap(map['author']) : null,
      cover: map['cover'] ?? '',
      description: map['description'],
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(id: $id, name: $name, author: $author, cover: $cover, description: $description, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.id == id &&
        other.name == name &&
        other.author == author &&
        other.cover == cover &&
        other.description == description &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        author.hashCode ^
        cover.hashCode ^
        description.hashCode ^
        isFavorite.hashCode;
  }
}
