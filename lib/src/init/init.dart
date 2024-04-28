import 'package:get_it/get_it.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client_impl.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource_impl.dart';
import 'package:sabor_natural_app/src/data/repositories/product_repository_impl.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_discounted_products_usecase.dart';
import 'package:sabor_natural_app/src/presenter/home/store/home_store.dart';
import 'package:sabor_natural_app/src/presenter/main/store/main_store.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory<MainStore>(() => MainStore());

  getIt.registerFactory<HttpClient>(
    () => HttpClientImpl(),
  );

  getIt.registerFactory<ProductDatasource>(
    () => ProductDatasourceImpl(httpClient: getIt<HttpClient>()),
  );

  getIt.registerFactory<ProductRepository>(
    () => ProductRepositoryImpl(datasource: getIt<ProductDatasource>()),
  );

  getIt.registerFactory<GetDiscountedProductsUsecase>(
    () => GetDiscountedProductsUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<HomeStore>(
    () => HomeStore(
      getDiscountedProductsUsecase: getIt<GetDiscountedProductsUsecase>(),
    ),
  );
}
