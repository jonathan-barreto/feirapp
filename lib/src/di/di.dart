import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/http_client/http_client_impl.dart';
import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/local_storage/local_storage_impl.dart';
import 'package:feirapp/src/data/datasources/auth_datasource.dart';
import 'package:feirapp/src/data/datasources/auth_datasource_impl.dart';
import 'package:feirapp/src/data/datasources/credential_datasource.dart';
import 'package:feirapp/src/data/datasources/credential_datasource_impl.dart';
import 'package:feirapp/src/data/datasources/local_product_datasource.dart';
import 'package:feirapp/src/data/datasources/local_product_datasource_impl.dart';
import 'package:feirapp/src/data/datasources/product_datasource.dart';
import 'package:feirapp/src/data/datasources/product_datasource_impl.dart';
import 'package:feirapp/src/data/repositories/auth_repository_impl.dart';
import 'package:feirapp/src/data/repositories/credential_repository_impl.dart';
import 'package:feirapp/src/data/repositories/local_product_repository_impl.dart';
import 'package:feirapp/src/data/repositories/product_repository_impl.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/domain/repositories/auth_repository.dart';
import 'package:feirapp/src/domain/repositories/credential_repository.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';
import 'package:feirapp/src/domain/usecases/get_all_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_favorites_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_if_product_is_favorite_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_more_products_by_link_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_product_by_id_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_products_by_ids_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_products_with_discount_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_user_credentials_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_user_usecase.dart';
import 'package:feirapp/src/domain/usecases/login_usecase.dart';
import 'package:feirapp/src/domain/usecases/logout_usecase.dart';
import 'package:feirapp/src/domain/usecases/remove_product_to_favorite_usecase.dart';
import 'package:feirapp/src/domain/usecases/remove_user_credential_usecase.dart';
import 'package:feirapp/src/domain/usecases/save_product_to_favorite_usecase.dart';
import 'package:feirapp/src/domain/usecases/save_user_credentials_usecase.dart';
import 'package:feirapp/src/presenter/favorites/controller/favorites_controller.dart';
import 'package:feirapp/src/presenter/home/controllers/home_controller.dart';
import 'package:feirapp/src/presenter/init/controller/init_controller.dart';
import 'package:feirapp/src/presenter/login/controller/login_controller.dart';
import 'package:feirapp/src/presenter/main/controllers/main_controller.dart';
import 'package:feirapp/src/presenter/product/controller/product_controller.dart';
import 'package:feirapp/src/presenter/profile/controller/profile_controller.dart';
import 'package:feirapp/src/presenter/search/controllers/search_filter_page_controller.dart';
import 'package:feirapp/src/presenter/search/controllers/search_page_controller.dart';
import 'package:feirapp/src/presenter/search/stores/filter_store.dart';
import 'package:feirapp/src/presenter/splash/controller/splash_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Local Storage
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerFactory<LocalStorage>(
    () => LocalStorageImpl(
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
  getIt.registerFactory<AuthDatasource>(
    () => AuthDatasourceImpl(
      httpClient: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<CredentialDatasource>(
    () => CredentialDatasourceImpl(
      storage: getIt<LocalStorage>(),
    ),
  );

  getIt.registerFactory<ProductDatasource>(
    () => ProductDatasourceImpl(
      httpClient: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<LocalProductDatasource>(
    () => LocalProductDatasourceImpl(
      storage: getIt<LocalStorage>(),
    ),
  );

  // Repositories
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      datasource: getIt<AuthDatasource>(),
    ),
  );

  getIt.registerFactory<CredentialRepository>(
    () => CredentialRepositoryImpl(
      datasource: getIt<CredentialDatasource>(),
    ),
  );

  getIt.registerFactory<ProductRepository>(
    () => ProductRepositoryImpl(
      datasource: getIt<ProductDatasource>(),
    ),
  );

  getIt.registerFactory<LocalProductRepository>(
    () => LocalProductRepositoryImpl(
      datasource: getIt<LocalProductDatasource>(),
    ),
  );

  // Usecases
  getIt.registerFactory<GetAllProductsUsecase>(
    () => GetAllProductsUsecase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<GetProductsWithDiscountUsecase>(
    () => GetProductsWithDiscountUsecase(
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

  getIt.registerFactory<SaveProductToFavoriteUsecase>(
    () => SaveProductToFavoriteUsecase(
      repository: getIt<LocalProductRepository>(),
    ),
  );

  getIt.registerFactory<LoginUsecase>(
    () => LoginUsecase(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<GetUserCredentialUsecase>(
    () => GetUserCredentialUsecase(
      repository: getIt<CredentialRepository>(),
    ),
  );

  getIt.registerFactory<SaveUserCredentialUsecase>(
    () => SaveUserCredentialUsecase(
      repository: getIt<CredentialRepository>(),
    ),
  );

  getIt.registerFactory<RemoveUserCredentialUsecase>(
    () => RemoveUserCredentialUsecase(
      repository: getIt<CredentialRepository>(),
    ),
  );

  getIt.registerFactory<GetUserUsecase>(
    () => GetUserUsecase(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<LogoutUsecase>(
    () => LogoutUsecase(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<GetIfProductIsFavoriteUsecase>(
    () => GetIfProductIsFavoriteUsecase(
      repository: getIt<LocalProductRepository>(),
    ),
  );

  getIt.registerFactory<RemoveProductToFavoritesUsecase>(
    () => RemoveProductToFavoritesUsecase(
      repository: getIt<LocalProductRepository>(),
    ),
  );

  getIt.registerFactory<GetFavoritesProductsUsecase>(
    () => GetFavoritesProductsUsecase(
      repository: getIt<LocalProductRepository>(),
    ),
  );

  // Controllers
  getIt.registerFactory<MainController>(() => MainController());

  getIt.registerFactory<HomeController>(
    () => HomeController(
      getProductsWithDiscountUsecase: getIt<GetProductsWithDiscountUsecase>(),
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
      saveProductToFavoriteUsecase: getIt<SaveProductToFavoriteUsecase>(),
      getIfProductIsFavoriteUsecase: getIt<GetIfProductIsFavoriteUsecase>(),
      removeProductToFavoritesUsecase: getIt<RemoveProductToFavoritesUsecase>(),
    ),
  );

  getIt.registerFactory<InitController>(
    () => InitController(),
  );

  getIt.registerFactory<LoginController>(
    () => LoginController(
      loginUsecase: getIt<LoginUsecase>(),
      saveUserCredentialsUsecase: getIt<SaveUserCredentialUsecase>(),
    ),
  );

  getIt.registerFactory<SplashController>(
    () => SplashController(
      getUserUsecase: getIt<GetUserUsecase>(),
      getUserCredentialsUsecase: getIt<GetUserCredentialUsecase>(),
    ),
  );

  getIt.registerFactory<ProfileController>(
    () => ProfileController(
      logoutUsecase: getIt<LogoutUsecase>(),
      removeUserCredentialUsecase: getIt<RemoveUserCredentialUsecase>(),
    ),
  );

  getIt.registerFactory<FavoritesController>(
    () => FavoritesController(
      getFavoritesProductsUsecase: getIt<GetFavoritesProductsUsecase>(),
      getProductsByIdsUsecase: getIt<GetProductsByIdsUsecase>(),
    ),
  );

  getIt.registerFactory<FilterStore>(
    () => FilterStore(),
  );

  // Singleton's
  getIt.registerLazySingleton<CurrentUserEntity>(
    () => CurrentUserEntity(),
  );
}
