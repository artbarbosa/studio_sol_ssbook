import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/modules/home/submodules/my_books/ui/controllers/my_books_controller.dart';
import 'package:studio_sol_ssbook/src/modules/home/submodules/my_books/ui/states/my_books_page_states.dart';

import '../../../../../../../mocks/mock.dart';

void main() {
  late MyBooksController controller;
  late IBookRepositoryMock bookRepository;
  late IAuthorRepositoryMock authorRepository;
  late IUserRepositoryMock userRepository;

  setUpAll(() {
    bookRepository = IBookRepositoryMock();
    authorRepository = IAuthorRepositoryMock();
    userRepository = IUserRepositoryMock();
    controller = MyBooksController(
      bookRepository,
      authorRepository,
      userRepository,
    );
  });

  group('MyBooksController - fetchMyBooks ', () {
    test('Should get and change value MyBooksLoadedState', () async {
      when(() => bookRepository.getAllBooks())
          .thenAnswer((_) async => listBookModelMock);
      when(() => bookRepository.getFavoriteBooks())
          .thenAnswer((_) async => listBookModelMock);
      when(() => authorRepository.getFavoriteAuthorsBooks())
          .thenAnswer((_) async => listAuthorModelMock);
      when(() => userRepository.getUser())
          .thenAnswer((_) async => userModelMock);

      await controller.fetchMyBooks();

      expect(controller.value, isA<MyBooksLoadedState>());
    });

    test('Should get and change value MyBooksErrorState', () async {
      when(() => bookRepository.getAllBooks())
          .thenAnswer((_) async => listBookModelMock);
      when(() => bookRepository.getFavoriteBooks())
          .thenAnswer((_) async => listBookModelMock);
      when(() => authorRepository.getFavoriteAuthorsBooks())
          .thenAnswer((_) async => listAuthorModelMock);
      when(() => userRepository.getUser()).thenThrow(ExceptionMock());

      await controller.fetchMyBooks();

      expect(controller.value, isA<MyBooksErrorState>());
    });
    test('Should get and change value MyBooksErrorState', () async {
      when(() => bookRepository.getAllBooks())
          .thenAnswer((_) async => listBookModelMock);
      when(() => bookRepository.getFavoriteBooks())
          .thenAnswer((_) async => listBookModelMock);
      when(() => authorRepository.getFavoriteAuthorsBooks())
          .thenThrow(ExceptionMock());
      when(() => userRepository.getUser())
          .thenAnswer((_) async => userModelMock);

      await controller.fetchMyBooks();

      expect(controller.value, isA<MyBooksErrorState>());
    });
    test('Should get and change value MyBooksErrorState', () async {
      when(() => bookRepository.getAllBooks()).thenThrow(ExceptionMock());
      when(() => bookRepository.getFavoriteBooks()).thenThrow(ExceptionMock());
      when(() => authorRepository.getFavoriteAuthorsBooks())
          .thenAnswer((_) async => listAuthorModelMock);
      when(() => userRepository.getUser())
          .thenAnswer((_) async => userModelMock);

      await controller.fetchMyBooks();

      expect(controller.value, isA<MyBooksErrorState>());
    });
  });
}
