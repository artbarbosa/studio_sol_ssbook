import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';

class MyBooksPage extends StatelessWidget {
  MyBooksPage({Key? key}) : super(key: key);
  final controller = GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: const [],
      ),
    );
  }
}
