import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/shared/failures/failures.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/graphql_http_client_impl.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late GraphqlHttpClientServiceImp clientService;
  late GraphQLClientMock graphQLClientMock;

  setUpAll(() {
    graphQLClientMock = GraphQLClientMock();
    clientService = GraphqlHttpClientServiceImp(graphQLClientMock);
  });

  test('Should throw  GraphqlHttpClientError', () async {
    when(() => graphQLClientMock.query(queryOptionsMock))
        .thenThrow(ExceptionMock());

    expect(() async => await clientService.query(''),
        throwsA(isA<GraphqlHttpClientError>()));
  });
}
