import 'package:flutter/material.dart';

import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CustomBottomNavigationBarController controller;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const ScrollPhysics(),
      controller: widget.controller.pageController,
      children: [
        Container(),
        Container(),
        Container(),
      ],
    );
  }
}
