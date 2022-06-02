import 'package:get_it/get_it.dart';

import '../ui/controllers/custom_bottom_navigation_bar_controller.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    //getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp(Dio()));

    // getIt.registerLazySingleton<IProductRepository>(
    //     () => ProductRepositoryImp(datasource: getIt()));

    // getIt.registerLazySingleton<IProductDataSource>(
    //     () => ProductDataSourceImp(httpClient: getIt()));

    // getIt.registerLazySingleton<IGetSingleProductByIdUseCase>(
    //     () => GetSingleProductByIdUseCaseImp(getIt()));

    // getIt.registerLazySingleton<IGetAllProductsUseCase>(
    //     () => GetAllProductsUseCaseImp(getIt()));

    // getIt.registerLazySingleton<IGetProductsBySpecificCategoryUseCase>(
    //     () => GetProductsBySpecificCategoryUseCaseImp(getIt()));

    // getIt.registerLazySingleton<IGetAllCategorysUseCase>(
    //     () => GetAllCategorysUseCaseImp(getIt()));

    // getIt.registerFactory<ProductController>(
    //     () => ProductController(getIt(), getIt()));

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
