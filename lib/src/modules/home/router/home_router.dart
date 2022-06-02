import 'package:flutter/material.dart';

import '../ui/container/home_container.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(
            builder: (context) {
              return const HomeContainerPage();
            },
          );
        }
        return null;
      },
    );
  }
}
