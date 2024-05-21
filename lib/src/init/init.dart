import 'package:get_it/get_it.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client_impl.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource_impl.dart';
import 'package:sabor_natural_app/src/data/repositories/product_repository_impl.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_all_products_usecase.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_discounted_products_usecase.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_more_products_by_link_usecase.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_products_by_ids_usecase.dart';
import 'package:sabor_natural_app/src/presenter/search/controllers/search_filter_page_controller.dart';
import 'package:sabor_natural_app/src/presenter/home/controllers/home_controller.dart';
import 'package:sabor_natural_app/src/presenter/main/controllers/main_controller.dart';
import 'package:sabor_natural_app/src/presenter/search/controllers/search_page_controller.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory<HttpClient>(
    () => HttpClientImpl(),
  );

  // Datasources
  getIt.registerFactory<ProductDatasource>(
    () => ProductDatasourceImpl(httpClient: getIt<HttpClient>()),
  );

  // Repositories
  getIt.registerFactory<ProductRepository>(
    () => ProductRepositoryImpl(datasource: getIt<ProductDatasource>()),
  );

  // Usecases
  getIt.registerFactory<GetAllProductsUsecase>(
    () => GetAllProductsUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<GetDiscountedProductsUsecase>(
    () => GetDiscountedProductsUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<GetProductsByIdsUsecase>(
    () => GetProductsByIdsUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<GetMoreProductsByLinkUsecase>(
    () => GetMoreProductsByLinkUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );
  
  // Controllers
  getIt.registerFactory<MainController>(() => MainController());

  getIt.registerFactory<HomeController>(
    () => HomeController(
      getDiscountedProductsUsecase: getIt<GetDiscountedProductsUsecase>(),
    ),
  );

  getIt.registerFactory<SearchPageController>(
    () => SearchPageController(
      getAllProductsUsecase: getIt<GetAllProductsUsecase>(),
      getMoreProductsByLinkUsecase: getIt<GetMoreProductsByLinkUsecase>(),
    ),
  );

  getIt.registerFactory<SearchFilterPageController>(
    () => SearchFilterPageController(),
  );
}
