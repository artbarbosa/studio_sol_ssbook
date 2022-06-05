import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/http_client_service.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

class ExceptionMock extends Mock implements Exception {}

class IHttpClientServiceMock extends Mock implements IHttpClientService {}

final queryOptionsMock = QueryOptions(
  document: gql(''),
);

final Map<String, dynamic> mapDataMock = {};

final QueryResult queryResultMock = QueryResult(
  source: QueryResultSource.network,
  data: mapDataMock,
  options: QueryOptions(
    document: gql(''),
  ),
);

const Map<String, dynamic> mapGetAllBooks = {
  "data": {
    "allBooks": [
      {
        "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
        "cover":
            "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
        "author": {"name": "Robert Cecil Martin"}
      },
      {
        "name":
            "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
        "cover":
            "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-architecture.jpg",
        "author": {"name": "Robert Cecil Martin"}
      },
    ]
  }
};
const mapGetFavoriteAuthors = {
  "favoriteAuthors": [
    {
      "name": "Robert Cecil Martin",
      "booksCount": 4,
      "picture":
          "https://sscdn.co/gcs/studiosol/2022/mobile/author/uncle-bob.jpg"
    },
    {
      "name": "J. R. R. Tolkien",
      "booksCount": 4,
      "picture":
          "https://sscdn.co/gcs/studiosol/2022/mobile/author/j-r-r-tolkien.jpg"
    },
    {
      "name": "Afonso Padilha",
      "booksCount": 1,
      "picture":
          "https://sscdn.co/gcs/studiosol/2022/mobile/author/afonso-padilha.jpg"
    }
  ]
};
