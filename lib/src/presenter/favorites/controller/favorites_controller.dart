import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';
import 'package:feirapp/src/domain/usecases/get_favorites_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_products_by_ids_usecase.dart';
import 'package:flutter/material.dart';

class FavoritesController extends ChangeNotifier {
  final GetFavoritesProductsUsecase getFavoritesProductsUsecase;
  final GetProductsByIdsUsecase getProductsByIdsUsecase;

  FavoritesController({
    required this.getFavoritesProductsUsecase,
    required this.getProductsByIdsUsecase,
  });

  bool loading = true;

  List<String>? productsIds;
  List<ProductEntity>? products;

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<String?> init() async {
    showLoading();

    String? errorMessage;

    errorMessage = await getFavoritesProducts();

    if (errorMessage == null && productsIds != null) {
      errorMessage = await getProductsByIds();
    }

    hideLoading();

    return errorMessage;
  }

  Future<String?> getFavoritesProducts() async {
    String? errorMessage;

    final result = await getFavoritesProductsUsecase(
      NoParams(),
    );

    result.fold((l) {
      if (l is StorageFailure) {
        errorMessage = l.message;
      }
    }, (r) => productsIds = r);

    return errorMessage;
  }

  List<int> _getListInt() {
    return productsIds?.map((e) => int.parse(e)).toList() ?? [];
  }

  Future<String?> getProductsByIds() async {
    String? errorMessage;

    final List<int> ids = _getListInt();

    final GetProductsByIdsParam param = GetProductsByIdsParam(
      productsIds: ids,
    );

    final result = await getProductsByIdsUsecase(
      param,
    );

    result.fold((l) {
      if (l is ServerFailure) {
        errorMessage = l.message;
      }
    }, (r) => products = r.products);

    return errorMessage;
  }
}
