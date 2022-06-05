import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/book/datasources/remote/author_remote_datasource.dart';
import 'package:studio_sol_ssbook/src/core/book/model/author_model.dart';
import 'package:studio_sol_ssbook/src/core/book/repositories/author_repository.dart';

import '../../../../mocks/mock.dart';

class IAuthorRemoteDataSourceMock extends Mock
    implements IAuthorRemoteDataSource {}

void main() {
  late AuthorRepository repository;
  late IAuthorRemoteDataSourceMock datasource;
  setUpAll(() {
    datasource = IAuthorRemoteDataSourceMock();
    repository = AuthorRepository(datasource: datasource);
  });

  group('AuthorRepository - getFavoriteAuthorsBooks', () {
    test('Should return List AuthorModel', () async {
      when(() => datasource.getfavoriteAuthors())
          .thenAnswer((_) async => mapGetFavoriteAuthors);

      final result = await repository.getFavoriteAuthorsBooks();

      expect(result, isA<List<AuthorModel>>());
    });
  });
}
