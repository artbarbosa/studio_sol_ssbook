import 'package:graphql/client.dart';

abstract class IAuthorRemoteDataSource {}

class AuthorRemoteDataSource implements IAuthorRemoteDataSource {
  query() async {
    String readRepositories = r"""
query AllFavoriteBooks {
  favoriteBooks {
    name 
    author {
      name
    }
    cover
  }
}""";

    final client = GraphQLClient(
      link:
          HttpLink('https://us-central1-ss-devops.cloudfunctions.net/GraphQL'),
      cache: GraphQLCache(),
    );
    var result =
        await client.query(QueryOptions(document: gql(readRepositories)));
    return result.data;
  }
}
