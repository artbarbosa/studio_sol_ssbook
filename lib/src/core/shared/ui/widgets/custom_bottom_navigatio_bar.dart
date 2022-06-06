import 'package:flutter/material.dart';

import '../../consts/app_colors_const.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.controller})
      : super(key: key);

  final CustomBottomNavigationBarController controller;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColorsConst.onPrimary,
      selectedItemColor: AppColorsConst.primary,
      unselectedItemColor: AppColorsConst.secondary,
      elevation: 100,
      currentIndex: widget.controller.selectedIndex,
      onTap: (value) => widget.controller.changePage(value),
      items: const [
        BottomNavigationBarItem(
          label: 'Início',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Adicionar',
          icon: Icon(Icons.add_circle),
        ),
        BottomNavigationBarItem(
          label: 'Buscar',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon(Icons.favorite),
        )
      ],
    );
  }
}
