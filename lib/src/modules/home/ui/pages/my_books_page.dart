import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:studio_sol_ssbook/src/modules/home/ui/components/custom_card_author.dart';

import '../../../../core/shared/consts/app_text_styles_const.dart';
import '../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../components/custom_list_card_book_component.dart';
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
            physics: const NeverScrollableScrollPhysics(),
            controller: controllerBottomNavigation.scrollController,
            child: Column(
              children: [
                // Meus Favoritos
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 32, bottom: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Meus Favoritos',
                          style: AppTextStylesConst.titleHome),
                      Text('ver todos',
                          style: AppTextStylesConst.secondaryHome),
                    ],
                  ),
                ),
                // Lista de livros favoritos
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: value.listFavoriteBooks.length,
                    itemBuilder: (_, idx) => CustomListCardBookComponent(
                      book: value.listFavoriteBooks[idx],
                    ),
                  ),
                ),
                //Container Branco
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 32, bottom: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Meus Favoritos',
                                style: AppTextStylesConst.titleHome),
                            Text('ver todos',
                                style: AppTextStylesConst.secondaryHome),
                          ],
                        ),
                      ),
                      //Lista de Autores
                      Container(
                        color: Colors.amber,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return CustomCardAuthor(
                              author: value.listFavoriteAuthors[index],
                            );
                          },
                        ),
                      ),
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
