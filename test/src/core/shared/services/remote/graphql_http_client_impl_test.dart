import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/shared/failures/failures.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/graphql_http_client_impl.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late GraphqlHttpClientServiceImp client;
  late GraphQLClientMock graphQLClient;

  final queryOptions = QueryOptions(
    document: gql(''),
  );

  setUpAll(() {
    graphQLClient = GraphQLClientMock();
    client = GraphqlHttpClientServiceImp(graphQLClient);
  });

  group('GraphqlHttpClientServiceImp - query', () {
    test('Should return QueryResult', () async {
      when(() => graphQLClient.query(queryOptions))
          .thenAnswer((_) async => QueryResultMock());

      final result = await client.query(queryOptions);
      QueryOptions(
        document: gql(''),
      );

      expect(result, isA<QueryResultMock>());
    });

    test('Should throw  GraphqlHttpClientError', () async {
      when(() => graphQLClient.query(QueryOptionsMock()))
          .thenThrow(ExceptionMock());

      expect(() async => await client.query(QueryOptionsMock()),
          throwsA(isA<GraphqlHttpClientError>()));
    });
  });
}
