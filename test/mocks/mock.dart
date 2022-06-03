import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

class QueryResultMock extends Mock implements QueryResult {}

class QueryOptionsMock extends Mock implements QueryOptions {}

class ExceptionMock extends Mock implements Exception {}

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
