import 'package:graphql/client.dart';

import '../../../shared/consts/api_const.dart';
import '../../../shared/services/remote/http_client_service.dart';
import '../../failures/author_failures.dart';

abstract class IAuthorRemoteDataSource {
  Future<Map<dynamic, String>> getfavoriteAuthors();
}

class AuthorRemoteDataSource implements IAuthorRemoteDataSource {
  final IHttpClientService client;
  AuthorRemoteDataSource({
    required this.client,
  });

//   query() async {
//     String readRepositories = r"""
// query AllFavoriteBooks {
//   favoriteBooks {
//     name
//     author {
//       name
//     }
//     cover
//   }
// }""";
//     final client = GraphQLClient(
//       link:
//           HttpLink('https://us-central1-ss-devops.cloudfunctions.net/GraphQL'),
//       cache: GraphQLCache(),
//     );
//     var result =
//         await client.query(QueryOptions(document: gql(readRepositories)));
//     return result.data;
//   }

  @override
  Future<Map<dynamic, String>> getfavoriteAuthors() async {
    try {
      final QueryResult result = await client
          .query(QueryOptions(document: gql(ApiConst.queryFavoriteAuthors)));

      return result.data as Map<dynamic, String>;
    } catch (error, stackTrace) {
      throw AuthorRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
