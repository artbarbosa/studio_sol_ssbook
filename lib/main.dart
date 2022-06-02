import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:studio_sol_ssbook/src/core/shared/consts/api_const.dart';
import 'package:studio_sol_ssbook/src/core/shared/inject/inject.dart';

import 'src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.initialize();

  final client = GraphQLClient(
    link: HttpLink(ApiConst.apiUrl),
    cache: GraphQLCache(),
  );

  runApp(const AppWidget());
}
