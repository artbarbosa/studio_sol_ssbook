import '../datasources/remote/book_remote_datasource.dart';
import '../model/book_model.dart';

abstract class IBookRepository {
  Future<List<BookModel>> getFavoriteBooks();
  Future<List<BookModel>> getAllBooks();
  Future<BookModel> getBookById();
}

class BookRepository implements IBookRepository {
  final IBookRemoteDataSource datasource;

  BookRepository({
    required this.datasource,
  });

  @override
  Future<List<BookModel>> getAllBooks() {
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> getFavoriteBooks() {
    throw UnimplementedError();
  }

  @override
  Future<BookModel> getBookById() {
    throw UnimplementedError();
  }
}
