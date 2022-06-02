import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class CustomBottomNavigationBarController extends ValueNotifier<int> {
  CustomBottomNavigationBarController(super.value);

  final PageController _pageController = PageController();

  final ScrollController _scrollController = ScrollController();

  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);

  int get selectedIndex => value;

  PageController get pageController => _pageController;

  ScrollController get scrollController => _scrollController;

  ValueNotifier<bool> get isVisible => _isVisible;

  void changePage(int index) {
    _pageController.jumpToPage(index);
    value = index;
  }

  void _hideNav() => _isVisible.value = false;

  void _showNav() => _isVisible.value = true;

  bool isScrollingUp() =>
      _scrollController.position.userScrollDirection == ScrollDirection.forward;

  void scrollAddListener() => _scrollController.addListener(() {
        if (isScrollingUp()) {
          _showNav();
        } else {
          _hideNav();
        }
      });

  void scrollRemoveListener() => _scrollController.removeListener(() {
        if (isScrollingUp()) {
          _hideNav();
        } else {
          _showNav();
        }
      });
}
