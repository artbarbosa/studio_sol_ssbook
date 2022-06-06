import 'package:flutter_test/flutter_test.dart';
import 'package:studio_sol_ssbook/src/core/book/model/author_model.dart';

import '../../../../mocks/mock.dart';

void main() {
  group('AuthorModel - fromMap', () {
    test('should return a  AuthorModel', () {
      final result = AuthorModel.fromMap(authorMapMock);

      expect(result, isA<AuthorModel>());
      expect(result.booksCount, 4);
    });
  });
}
