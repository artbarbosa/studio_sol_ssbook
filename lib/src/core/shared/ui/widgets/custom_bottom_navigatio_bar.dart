import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();
    widget.controller.scrollAddListener();
  }

  @override
  void dispose() {
    widget.controller.scrollRemoveListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller.isVisible,
      builder: (_, __) => AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        height:
            widget.controller.isVisible.value ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              selectedItemColor: Colors.pink,
              unselectedItemColor: Colors.grey,
              elevation: 100,
              currentIndex: widget.controller.selectedIndex,
              onTap: (value) {
                widget.controller.changePage(value);
              },
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
            )
          ],
        ),
      ),
    );
  }
}
