import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/usecases/get_saved_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/update_product_quantity_usecase.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final GetSavedProductsUsecase getSavedProductsUsecase;
  final UpdateProductQuantityUsecase updateProductQuantityUsecase;

  CartController({
    required this.getSavedProductsUsecase,
    required this.updateProductQuantityUsecase,
  });

  bool loading = true;

  List<ProductEntity>? products;

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<void> getSavedProducts() async {
    showLoading();

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final result = await getSavedProductsUsecase(
      NoParams(),
    );

    result.fold((l) => null, (r) => products = r);
    notifyListeners();

    hideLoading();
  }

  Future<void> addQuantity({required ProductEntity product}) async {
    product.quantity = product.quantity + 1;

    updateProductQuantity(
      product: product,
    );

    notifyListeners();
  }

  Future<void> removeQuantity({required ProductEntity product}) async {
    product.quantity = product.quantity - 1;

    updateProductQuantity(
      product: product,
    );

    notifyListeners();
  }

  Future<void> updateProductQuantity({required ProductEntity product}) async {
    final Either<Failure, bool> result = await updateProductQuantityUsecase(
      product,
    );
  }
}
