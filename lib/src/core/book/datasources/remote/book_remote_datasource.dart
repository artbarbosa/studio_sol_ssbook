import 'package:graphql/client.dart';

import '../../../shared/consts/api_const.dart';
import '../../../shared/services/remote/http_client_service.dart';
import '../../failures/book_failures.dart';

abstract class IBookRemoteDataSource {
  Future<Map<String, dynamic>> getAllBooks();
  Future<Map<String, dynamic>> getFavoriteBooks();
  Future<Map<String, dynamic>> getBookById(int id);
}

class BookRemoteDataSource implements IBookRemoteDataSource {
  final IHttpClientService client;

  BookRemoteDataSource({
    required this.client,
  });

  @override
  Future<Map<String, dynamic>> getAllBooks() async {
    try {
      final QueryResult result = await client
          .query(QueryOptions(document: gql(ApiConst.queryAllBooks)));

      return result.data as Map<String, dynamic>;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getBookById(int id) async {
    try {
      final QueryResult result = await client
          .query(QueryOptions(document: gql(ApiConst.queryBookById(id))));

      return result.data as Map<String, dynamic>;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getFavoriteBooks() async {
    try {
      final QueryResult result = await client
          .query(QueryOptions(document: gql(ApiConst.queryFavoriteBooks)));

      return result.data as Map<String, dynamic>;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
