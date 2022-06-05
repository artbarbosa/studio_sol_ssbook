import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/core/book/datasources/remote/book_remote_datasource.dart';
import 'package:studio_sol_ssbook/src/core/book/failures/book_failures.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late BookRemoteDataSource datasource;
  late IHttpClientServiceMock httpClientMock;

  setUpAll(() {
    httpClientMock = IHttpClientServiceMock();
    datasource = BookRemoteDataSource(client: httpClientMock);
  });

  group('BookRemoteDataSource - getAllBooks', () {
    test('Should return Map', () async {
      when(() => httpClientMock.query(any()))
          .thenAnswer((_) async => queryResultMock);

      final result = await datasource.getAllBooks();

      expect(result, isA<Map<String, dynamic>>());
    });
    test('Should return BookRemoteDataSourceError', () async {
      when(() => httpClientMock.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getAllBooks(),
          throwsA(isA<BookRemoteDataSourceError>()));
    });
  });
  group('BookRemoteDataSource - getBookById', () {
    test('Should return Map', () async {
      when(() => httpClientMock.query(any()))
          .thenAnswer((_) async => queryResultMock);

      final result = await datasource.getBookById('');

      expect(result, isA<Map<String, dynamic>>());
    });
    test('Should throws BookRemoteDataSourceError', () async {
      when(() => httpClientMock.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getBookById(''),
          throwsA(isA<BookRemoteDataSourceError>()));
    });
  });

  group('BookRemoteDataSource - getFavoriteBooks', () {
    test('Should return Map', () async {
      when(() => httpClientMock.query(any()))
          .thenAnswer((_) async => queryResultMock);

      final result = await datasource.getFavoriteBooks();

      expect(result, isA<Map<String, dynamic>>());
    });
    test('Should throws BookRemoteDataSourceError', () async {
      when(() => httpClientMock.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getFavoriteBooks(),
          throwsA(isA<BookRemoteDataSourceError>()));
    });
  });
}
