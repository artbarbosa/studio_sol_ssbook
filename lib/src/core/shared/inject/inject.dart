import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import '../../book/datasources/remote/book_remote_datasource.dart';
import '../../book/repositories/book_repository.dart';
import '../consts/api_const.dart';
import '../services/remote/graphql_http_client_impl.dart';
import '../services/remote/http_client_service.dart';
import '../ui/controllers/custom_bottom_navigation_bar_controller.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    getIt.registerLazySingleton<GraphQLClient>(
      () => GraphQLClient(
        link: HttpLink(ApiConst.apiUrl),
        cache: GraphQLCache(),
      ),
    );

    getIt.registerLazySingleton<IHttpClientService>(
        () => GraphqlHttpClientServiceImp(getIt()));

    getIt.registerLazySingleton<IBookRemoteDataSource>(
        () => BookRemoteDataSource(client: getIt()));

    getIt.registerLazySingleton<IBookRepository>(
        () => BookRepository(datasource: getIt()));

    // getIt.registerFactory<CategoryController>(
    //   () => CategoryController(getIt()),
    // );

    // getIt.registerFactory<DetailProductController>(
    //   () => DetailProductController(getIt()),
    // );

    getIt.registerLazySingleton<CustomBottomNavigationBarController>(
      () => CustomBottomNavigationBarController(0),
    );
  }
}
