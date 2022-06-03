import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/book/datasources/remote/book_remote_datasource.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/http_client_service.dart';

import '../../../../../mocks/mock.dart';

class IHttpClientServiceMock extends Mock implements IHttpClientService {}

void main() {
  late BookRemoteDataSource data;
  late IHttpClientServiceMock clientHttp;

  final queryOptions = QueryOptions(
    document: gql(''),
  );
  setUpAll(() {
    clientHttp = IHttpClientServiceMock();
    data = BookRemoteDataSource(client: clientHttp);
  });

  group('BookRemoteDataSource - getAllBooks', () {
    test('Should return List<Map>>', () async {
      when(() => clientHttp.query(queryOptions)).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: mapGetAllBooks,
          options: QueryOptions(
            document: gql(''),
          ),
        ),
      );
      final result = await data.getAllBooks();

      expect(result, isA<Map<dynamic, String>>());
    });
  });
}
