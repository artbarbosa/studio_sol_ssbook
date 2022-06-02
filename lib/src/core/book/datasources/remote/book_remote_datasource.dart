import 'package:graphql/client.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/http_client_service.dart';

import '../../../shared/consts/api_const.dart';
import '../../failures/book_failures.dart';

abstract class IBookRemoteDataSource {
  Future<Map<dynamic, String>> getAllBooks();
  Future<Map<dynamic, String>> getFavoriteBooks();
  Future<Map<dynamic, String>> getBookById(int id);
}

class BookRemoteDataSource implements IBookRemoteDataSource {
  final IHttpClientService client;

  BookRemoteDataSource({
    required this.client,
  });
  // query() async {
  //   final client = GraphQLClient(
  //     link: HttpLink(ApiConst.apiUrl),
  //     cache: GraphQLCache(),
  //   );
  //   final QueryResult result = await client
  //       .query(QueryOptions(document: gql(ApiConst.queryFavoriteBooks)));
  //   return result;
  // }

  @override
  Future<Map<dynamic, String>> getAllBooks() async {
    try {
      final QueryResult result = await client
          .query(QueryOptions(document: gql(ApiConst.queryAllBooks)));

      return result.data as Map<dynamic, String>;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Map<dynamic, String>> getBookById(int id) async {
    try {
      final QueryResult result = await client
          .query(QueryOptions(document: gql(ApiConst.queryBookById(id))));

      return result.data as Map<dynamic, String>;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Map<dynamic, String>> getFavoriteBooks() async {
    try {
      final QueryResult result = await client
          .query(QueryOptions(document: gql(ApiConst.queryFavoriteBooks)));

      return result.data as Map<dynamic, String>;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
