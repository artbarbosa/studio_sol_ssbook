import 'package:flutter/material.dart';

import '../ui/container/home_container.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeContainerPage();
  }
}
