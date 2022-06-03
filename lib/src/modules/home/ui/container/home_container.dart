import 'package:flutter/material.dart';
import 'package:studio_sol_ssbook/src/modules/home/ui/pages/my_books_page.dart';

import '../components/custom_app_bar_home.dart';

class HomeContainerPage extends StatefulWidget {
  const HomeContainerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeContainerPage> createState() => _HomeContainerPageState();
}

class _HomeContainerPageState extends State<HomeContainerPage> {
  // final homeController = GetIt.I.get<ProductController>();
  // final categoryController = GetIt.I.get<CategoryController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        // await categoryController.getAllCategorys();
        // final firstCategory = categoryController.getFirstCategory;
        // homeController.fetchProducts(firstCategory);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              CustomAppBarHome(
                innerBoxIsScrolled: innerBoxIsScrolled,
              ),
            ];
          },
          body: TabBarView(
            children: [
              const MyBooksPage(),
              const Center(
                child: Text('Emprestados'),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
