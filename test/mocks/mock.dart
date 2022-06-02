import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

class QueryResultMock extends Mock implements QueryResult {}

class QueryOptionsMock extends Mock implements QueryOptions {}

class ExceptionMock extends Mock implements Exception {}
