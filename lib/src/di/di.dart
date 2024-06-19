import 'package:feirapp/src/data/datasources/local/authentication_local_datasource.dart';
import 'package:feirapp/src/data/datasources/local/authentication_local_datasource_impl.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/domain/usecases/get_user_usecase.dart';
import 'package:feirapp/src/domain/usecases/save_user_credentials_usecase.dart';
import 'package:feirapp/src/presenter/splash/controller/splash_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/http_client/http_client_impl.dart';
import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/local_storage/shared_preferences_local_storage_impl.dart';
import 'package:feirapp/src/data/datasources/local/product_local_datasource.dart';
import 'package:feirapp/src/data/datasources/local/product_local_datasource_impl.dart';
import 'package:feirapp/src/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:feirapp/src/data/datasources/remote/authentication_remote_datasource_impl.dart';
import 'package:feirapp/src/data/datasources/remote/product_remote_datasource.dart';
import 'package:feirapp/src/data/datasources/remote/product_remote_datasource_impl.dart';
import 'package:feirapp/src/data/repositories/authentication_repository_impl.dart';
import 'package:feirapp/src/data/repositories/product_repository_impl.dart';
import 'package:feirapp/src/domain/repositories/authentication_repository.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';
import 'package:feirapp/src/domain/usecases/get_all_favorite_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_all_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_discounted_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_more_products_by_link_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_product_by_id_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_products_by_ids_usecase.dart';
import 'package:feirapp/src/domain/usecases/login_usecase.dart';
import 'package:feirapp/src/domain/usecases/remove_key_usecase.dart';
import 'package:feirapp/src/domain/usecases/set_product_to_favorite_usecase.dart';
import 'package:feirapp/src/presenter/init/controller/init_controller.dart';
import 'package:feirapp/src/presenter/login/controller/login_controller.dart';
import 'package:feirapp/src/presenter/product/controller/product_controller.dart';
import 'package:feirapp/src/presenter/search/controllers/search_filter_page_controller.dart';
import 'package:feirapp/src/presenter/home/controllers/home_controller.dart';
import 'package:feirapp/src/presenter/main/controllers/main_controller.dart';
import 'package:feirapp/src/presenter/search/controllers/search_page_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Local Storage
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerFactory<LocalStorage>(
    () => SharedPreferencesLocalStorage(
      prefs: prefs,
    ),
  );

  // HttpClient
  getIt.registerFactory<HttpClient>(
    () => HttpClientImpl(
      localStorage: getIt<LocalStorage>(),
    ),
  );

  // Datasources
  getIt.registerFactory<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(httpClient: getIt<HttpClient>()),
  );

  getIt.registerFactory<ProductLocalDatasource>(
    () => ProductLocalDatasourceImpl(storage: getIt<LocalStorage>()),
  );

  getIt.registerFactory<AuthenticationLocalDatasource>(
    () => AuthenticationLocalDatasourceImpl(
      storage: getIt<LocalStorage>(),
    ),
  );

  getIt.registerFactory<AuthenticationRemoteDatasource>(
    () => AuthenticationRemoteDatasourceImpl(
      httpClient: getIt<HttpClient>(),
    ),
  );

  // Repositories
  getIt.registerFactory<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDatasource: getIt<ProductRemoteDatasource>(),
      localDatasource: getIt<ProductLocalDatasource>(),
    ),
  );

  getIt.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDatasource: getIt<AuthenticationRemoteDatasource>(),
      localDatasource: getIt<AuthenticationLocalDatasource>(),
    ),
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

  getIt.registerFactory<GetProductByIdUsecase>(
    () => GetProductByIdUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<GetMoreProductsByLinkUsecase>(
    () => GetMoreProductsByLinkUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<GetAllFavoriteProductUsecase>(
    () => GetAllFavoriteProductUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<SetProductToFavoriteUsecase>(
    () => SetProductToFavoriteUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<RemoveKeyUsecase>(
    () => RemoveKeyUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<LoginUsecase>(
    () => LoginUsecase(
      repository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerFactory<SaveUserCredentialsUsecase>(
    () => SaveUserCredentialsUsecase(
      repository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerFactory<GetUserUsecase>(
    () => GetUserUsecase(
      repository: getIt<AuthenticationRepository>(),
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

  getIt.registerFactory<ProductController>(
    () => ProductController(
      getProductByIdUsecase: getIt<GetProductByIdUsecase>(),
      getAllFavoriteProductUsecase: getIt<GetAllFavoriteProductUsecase>(),
      setProductToFavoriteUsecase: getIt<SetProductToFavoriteUsecase>(),
      removeKeyUsecase: getIt<RemoveKeyUsecase>(),
    ),
  );

  getIt.registerFactory<InitController>(
    () => InitController(),
  );

  getIt.registerFactory<LoginController>(
    () => LoginController(
      loginUsecase: getIt<LoginUsecase>(),
      saveUserCredentialsUsecase: getIt<SaveUserCredentialsUsecase>(),
    ),
  );

  getIt.registerFactory<SplashController>(
    () => SplashController(
      getUserUsecase: getIt<GetUserUsecase>(),
    ),
  );

  //
  getIt.registerLazySingleton<CurrentUserEntity>(
    () => CurrentUserEntity(),
  );
}
