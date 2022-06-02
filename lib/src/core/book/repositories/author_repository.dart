import '../datasources/remote/author_remote_datasource.dart';
import '../failures/author_failures.dart';
import '../model/author_model.dart';

abstract class IAuthorRepository {
  Future<List<AuthorModel>> getFavoriteAuthorsBooks();
}

class AuthorRepository implements IAuthorRepository {
  final IAuthorRemoteDataSource datasource;

  AuthorRepository(this.datasource);

  @override
  Future<List<AuthorModel>> getFavoriteAuthorsBooks() async {
    try {
      final result = await datasource.getfavoriteAuthors();
      final list = result['favoriteBooks'] as List;
      return list.map((e) => AuthorModel.fromMap(e)).toList();
    } catch (error, stackTrace) {
      throw AuthorRepositoryError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
