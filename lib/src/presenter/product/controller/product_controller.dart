import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/usecases/get_if_product_is_favorite_usecase.dart';
import 'package:feirapp/src/domain/usecases/remove_product_to_favorite_usecase.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/usecases/get_product_by_id_usecase.dart';
import 'package:feirapp/src/domain/usecases/save_product_to_favorite_usecase.dart';

class ProductController extends ChangeNotifier {
  final GetProductByIdUsecase getProductByIdUsecase;
  final SaveProductToFavoriteUsecase saveProductToFavoriteUsecase;
  final GetIfProductIsFavoriteUsecase getIfProductIsFavoriteUsecase;
  final RemoveProductToFavoritesUsecase removeProductToFavoritesUsecase;

  ProductController({
    required this.getProductByIdUsecase,
    required this.saveProductToFavoriteUsecase,
    required this.getIfProductIsFavoriteUsecase,
    required this.removeProductToFavoritesUsecase,
  });

  final DebounceService debounce = DebounceServiceImpl();

  String productId = '';

  bool loading = true;
  bool hasError = false;
  bool productIsFavorite = false;

  int quantity = 1;
  String? productPrice;

  ProductEntity? product;

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<void> init({required String id}) async {
    showLoading();

    productId = id;

    await checkIfProductIsFavorite();

    await getProduct();

    hideLoading();
  }

  Future<void> checkIfProductIsFavorite() async {
    final result = await getIfProductIsFavoriteUsecase(
      productId,
    );

    result.fold((l) => null, (r) => productIsFavorite = r);

    notifyListeners();
  }

  Future<void> getProduct() async {
    final response = await getProductByIdUsecase.call(
      productId,
    );

    response.fold((l) => hasError = true, (r) => product = r.products.first);

    productPrice = product?.discountPrice ?? product?.price;
  }

  void incrementQuantity() {
    quantity = quantity + 1;
    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity = quantity - 1;
    }

    notifyListeners();
  }

  Future<void> saveProductToFavorites() async {
    final Either<Failure, bool> result = await saveProductToFavoriteUsecase(
      productId,
    );

    result.fold((l) => null, (r) => null);

    checkIfProductIsFavorite();
  }

  Future<void> removeProductToFavorites() async {
    final result = await removeProductToFavoritesUsecase(
      productId,
    );

    result.fold((l) => null, (r) => null);

    checkIfProductIsFavorite();
  }
}
