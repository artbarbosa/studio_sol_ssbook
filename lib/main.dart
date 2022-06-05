import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studio_sol_ssbook/src/core/shared/inject/inject.dart';

import 'src/app_widget.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  Inject.initialize();

  runApp(const AppWidget());
}
