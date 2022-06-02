import '../model/author_model.dart';

abstract class IAuthorRepository {
  Future<List<AuthorModel>> getFavoriteAuthorsBooks();
}

class AuthorRepository implements IAuthorRepository {
  @override
  Future<List<AuthorModel>> getFavoriteAuthorsBooks() {
    throw UnimplementedError();
  }
}
