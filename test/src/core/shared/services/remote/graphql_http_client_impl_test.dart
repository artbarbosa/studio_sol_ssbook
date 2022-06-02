import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/shared/failures/failures.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/graphql_http_client_impl.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late GraphqlHttpClientServiceImp client;
  late GraphQLClientMock graphQLClient;

  setUpAll(() {
    graphQLClient = GraphQLClientMock();
    client = GraphqlHttpClientServiceImp(graphQLClient);
  });

  test('Should return QueryResult', () async {
    when(() => graphQLClient.query(any()))
        .thenAnswer((_) async => QueryResultMock());

    final result = await client.query(QueryOptionsMock());

    expect(result, isA<QueryOptions>());
  });

  test('Should throw  GraphqlHttpClientError', () async {
    when(() => graphQLClient.query(any())).thenThrow(ExceptionMock());

    expect(() async => await client.query(QueryOptionsMock()),
        throwsA(isA<GraphqlHttpClientError>()));
  });
}
