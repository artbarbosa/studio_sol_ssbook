import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../components/library_list_component.dart';
import '../components/list_favorite_authors_component.dart';
import '../components/list_favorite_books_component.dart';
import '../controllers/my_books_controller.dart';
import '../states/my_books_page_states.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({Key? key}) : super(key: key);

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  final controller = GetIt.I.get<MyBooksController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        controller.fetchMyBooks();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        if (value is MyBooksLoadedState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Meus Favoritos
                ListFavoriteBooksComponent(
                    listFavoriteBooks: value.listFavoriteBooks),
                //Container Branco
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListFavoriteAuthorsComponent(
                          listFavoriteAuthors: value.listFavoriteAuthors),

                      // Biblioteca
                      LibraryListComponent(listAllBooks: value.listAllBooks),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (value is MyBooksErrorState) {
          return Container();
        }

        return Container();
      },
    );
  }
}
