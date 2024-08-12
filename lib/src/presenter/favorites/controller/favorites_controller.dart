import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';
import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';
import 'package:feirapp/src/domain/usecases/get_favorites_products_by_filters_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_favorites_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_products_by_ids_usecase.dart';
import 'package:feirapp/src/domain/usecases/remove_product_to_favorite_usecase.dart';
import 'package:flutter/material.dart';

class FavoritesController extends ChangeNotifier {
  final GetFavoritesProductsUsecase getFavoritesProductsUsecase;
  final GetFavoritesProductsByFiltersUsecase
      getFavoritesProductsByFiltersUsecase;
  final GetProductsByIdsUsecase getProductsByIdsUsecase;
  final RemoveProductToFavoritesUsecase removeProductToFavoritesUsecase;

  FavoritesController({
    required this.getFavoritesProductsUsecase,
    required this.getFavoritesProductsByFiltersUsecase,
    required this.getProductsByIdsUsecase,
    required this.removeProductToFavoritesUsecase,
  });

  bool loading = true;
  bool filterLoading = false;

  List<String>? productsIds;
  List<ProductEntity>? products;

  SelectedFiltersEntity? selectedFilters;

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  void showFilterLoading() {
    filterLoading = true;
    notifyListeners();
  }

  void hideFilterLoading() {
    filterLoading = false;
    notifyListeners();
  }

  Future<String?> init() async {
    showLoading();

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

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

    notifyListeners();

    return errorMessage;
  }

  Future<String?> getFavoritesProductsByFilters({
    required SelectedFiltersEntity filters,
  }) async {
    showFilterLoading();

    String? errorMessage;

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final result = await getFavoritesProductsByFiltersUsecase(
      filters,
    );

    result.fold((l) {
      if (l is StorageFailure) {
        errorMessage = l.message;
      }
    }, (r) => productsIds = r);

    if (productsIds != null && productsIds!.isNotEmpty) {
      getProductsByIds();
    } else {
      products = [];
    }

    hideFilterLoading();

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
    }, (r) => products = r);

    notifyListeners();

    return errorMessage;
  }

  Future<String?> removeProductFromFavorites({required String id}) async {
    String? errorMessage;

    final Either<Failure, bool> result = await removeProductToFavoritesUsecase(
      id,
    );

    result.fold((l) {
      if (l is StorageFailure) {
        errorMessage = l.message;
      }
    }, (r) => null);

    if (errorMessage == null) {
      init();
    }

    final int? productIndex = products?.indexWhere((element) {
      return element.id == int.parse(id);
    });

    if (productIndex != null && products != null) {
      products?.removeAt(productIndex);
    }

    notifyListeners();

    return errorMessage;
  }
}
