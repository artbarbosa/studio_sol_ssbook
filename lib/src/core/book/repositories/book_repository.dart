import 'package:studio_sol_ssbook/src/core/book/failures/book_failures.dart';

import '../datasources/remote/book_remote_datasource.dart';
import '../model/book_model.dart';

abstract class IBookRepository {
  Future<List<BookModel>> getFavoriteBooks();
  Future<List<BookModel>> getAllBooks();
  Future<BookModel> getBookById(String id);
}

class BookRepository implements IBookRepository {
  final IBookRemoteDataSource datasource;

  BookRepository({
    required this.datasource,
  });

  @override
  Future<List<BookModel>> getAllBooks() async {
    try {
      final result = await datasource.getAllBooks();
      final list = result['allBooks'] as List;
      return list.map((e) => BookModel.fromMap(e)).toList();
    } catch (error, stackTrace) {
      throw BookRepositoryError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<BookModel>> getFavoriteBooks() async {
    try {
      final result = await datasource.getFavoriteBooks();
      final list = result['favoriteBooks'] as List;
      return list.map((e) => BookModel.fromMap(e)).toList();
    } catch (error, stackTrace) {
      throw BookRepositoryError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<BookModel> getBookById(String id) async {
    try {
      final result = await datasource.getBookById(id);
      final map = result['book'] as Map<String, dynamic>;
      return BookModel.fromMap(map);
    } catch (error, stackTrace) {
      throw BookRepositoryError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
