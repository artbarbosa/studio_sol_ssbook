import 'package:flutter/material.dart';

import '../../submodules/my_books/router/my_books_router.dart';
import '../components/custom_app_bar_home.dart';

class HomeContainerPage extends StatefulWidget {
  const HomeContainerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeContainerPage> createState() => _HomeContainerPageState();
}

class _HomeContainerPageState extends State<HomeContainerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {},
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
              const MyBooksRouter(),
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
