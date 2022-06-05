import 'dart:convert';

class UserModel {
  String picture;
  UserModel({
    required this.picture,
  });

  UserModel copyWith({
    String? picture,
  }) {
    return UserModel(
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'picture': picture});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.picture == picture;
  }

  @override
  int get hashCode => picture.hashCode;
}
