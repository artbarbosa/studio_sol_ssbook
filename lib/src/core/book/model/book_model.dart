import 'dart:convert';

import 'author_model.dart';

class BookModel {
  final String id;
  final String? name;
  final AuthorModel? author;
  final String cover;
  final String? description;
  BookModel({
    required this.id,
    this.name,
    this.author,
    required this.cover,
    this.description,
  });

  BookModel copyWith({
    String? id,
    String? name,
    AuthorModel? author,
    String? cover,
    String? description,
  }) {
    return BookModel(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      cover: cover ?? this.cover,
      description: description ?? this.description,
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

    return result;
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? '',
      name: map['name'],
      author: map['author'] != null ? AuthorModel.fromMap(map['author']) : null,
      cover: map['cover'] ?? '',
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(id: $id, name: $name, author: $author, cover: $cover, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.id == id &&
        other.name == name &&
        other.author == author &&
        other.cover == cover &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        author.hashCode ^
        cover.hashCode ^
        description.hashCode;
  }
}
