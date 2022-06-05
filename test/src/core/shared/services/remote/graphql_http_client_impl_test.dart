import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/graphql_http_client_impl.dart';

import '../../../../../mocks/mock.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

class QueryResultMock extends Mock implements QueryResult {}

void main() {
  late GraphqlHttpClientServiceImp clientService;
  late GraphQLClientMock graphQLClientMock;

  final document = 'asd';

  final queryOptions = QueryOptions(
    document: gql(document),
  );
  final queryResult = QueryResult(
    data: mapGetAllBooks,
    options: queryOptions,
    source: QueryResultSource.network,
  );

  setUpAll(() {
    graphQLClientMock = GraphQLClientMock();
    clientService = GraphqlHttpClientServiceImp(graphQLClientMock);
  });

  group('GraphqlHttpClientServiceImp - query', () {
    test('Should return QueryResult', () async {
      when(() => graphQLClientMock.query(queryOptions))
          .thenAnswer((invocation) async => queryResult);

      final result = await clientService.query(document);

      expect(result, isA<QueryResult>());
    });

    test('Should throw  GraphqlHttpClientError', () async {});
  });
}
