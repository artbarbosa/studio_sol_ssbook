import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:studio_sol_ssbook/src/core/book/datasources/remote/book_remote_datasource.dart';
import 'package:studio_sol_ssbook/src/core/shared/consts/api_const.dart';
import 'package:studio_sol_ssbook/src/core/shared/services/remote/graphql_http_client_impl.dart';

void main() async {
  final client = GraphQLClient(
    link: HttpLink(ApiConst.apiUrl),
    cache: GraphQLCache(),
  );
  final sla2 = GraphqlHttpClientServiceImp(client);
  var sla = BookRemoteDataSource(client: sla2);
  var result = await sla.getAllBooks();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeTest(),
    );
  }
}

class HomeTest extends StatelessWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(),
    );
  }
}
