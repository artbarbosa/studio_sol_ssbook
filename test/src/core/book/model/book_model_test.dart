import 'package:flutter_test/flutter_test.dart';
import 'package:studio_sol_ssbook/src/core/book/model/book_model.dart';

import '../../../../mocks/mock.dart';

void main() {
  group('BookModel - fromMap', () {
    test('should return a  BookModel', () {
      final result = BookModel.fromMap(bookMapMock);

      expect(result, isA<BookModel>());
      expect(result.name,
          "Clean Code: A Handbook of Agile Software Craftsmanship");
    });
  });
}
