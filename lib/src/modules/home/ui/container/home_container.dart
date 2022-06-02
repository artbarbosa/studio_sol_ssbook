import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';

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
  final controller = GetIt.I.get<CustomBottomNavigationBarController>();

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
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('SSBOOK'),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    const Tab(
                        child: Text('Meus Livros',
                            style: TextStyle(fontSize: 14))),
                    const Tab(
                        child: Text('Emprestados',
                            style: TextStyle(fontSize: 14))),
                    Container(),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: const [],
                ),
              ),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
