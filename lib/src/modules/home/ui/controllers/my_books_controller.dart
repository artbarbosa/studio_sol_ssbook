import 'package:flutter/material.dart';
import 'package:studio_sol_ssbook/src/core/book/model/author_model.dart';
import 'package:studio_sol_ssbook/src/core/book/repositories/author_repository.dart';
import 'package:studio_sol_ssbook/src/core/book/repositories/book_repository.dart';

import '../../../../core/book/model/book_model.dart';
import '../states/my_books_page_states.dart';

class MyBooksController extends ValueNotifier<MyBooksPageState> {
  final BookRepository bookRepository;
  final AuthorRepository authorRepository;

  MyBooksController(
    this.bookRepository,
    this.authorRepository,
  ) : super(MyBooksLoadingState());

  List<BookModel> _listFavoriteBooks = [];
  List<BookModel> _listAllBooks = [];
  List<AuthorModel> _listFavoriteAuthors = [];

  Future<void> _getFavoriteBooks() async =>
      _listFavoriteBooks = await bookRepository.getFavoriteBooks();

  Future<void> _getAllBooks() async =>
      _listAllBooks = await bookRepository.getAllBooks();

  Future<void> _getFavoriteAuthorsBooks() async =>
      _listFavoriteAuthors = await authorRepository.getFavoriteAuthorsBooks();

  Future<void> fetchMyBooks() async {
    value = MyBooksLoadingState();
    try {
      await _getFavoriteBooks();
      await _getFavoriteAuthorsBooks();
      await _getAllBooks();
      value = MyBooksLoadedState(
        listAllBooks: _listAllBooks,
        listFavoriteAuthors: _listFavoriteAuthors,
        listFavoriteBooks: _listFavoriteBooks,
      );
    } catch (e) {
      value = MyBooksErrorState(errorMessage: e.toString());
    }
  }
}
