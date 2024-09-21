import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/usecases/get_products_from_cart_usecase.dart';
import 'package:feirapp/src/domain/usecases/update_product_quantity_usecase.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final GetProductsFromCartUsecase getProductsFromCartUsecase;
  final UpdateProductQuantityUsecase updateProductQuantityUsecase;

  CartController({
    required this.getProductsFromCartUsecase,
    required this.updateProductQuantityUsecase,
  });

  bool loading = true;

  List<ProductEntity>? products;
  double cartTotal = 0;

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

    final result = await getProductsFromCartUsecase(
      NoParams(),
    );

    result.fold((l) => null, (r) => products = r);
    notifyListeners();

    setCartTotal();

    hideLoading();
  }

  Future<void> setCartTotal() async {
    cartTotal = 0;

    if (products != null) {
      for (int index = 0; index < (products?.length ?? 0); index++) {
        final ProductEntity product = products![index];

        final double price = double.parse(
          product.discountPrice ?? product.price,
        );

        cartTotal = cartTotal + (price * product.quantity);
      }
    }

    notifyListeners();
  }

  Future<void> addQuantity({required ProductEntity product}) async {
    product.quantity = product.quantity + 1;

    updateProductQuantity(
      product: product,
    );

    setCartTotal();

    notifyListeners();
  }

  Future<void> removeQuantity({required ProductEntity product}) async {
    product.quantity = product.quantity - 1;

    updateProductQuantity(
      product: product,
    );

    setCartTotal();

    notifyListeners();
  }

  Future<void> updateProductQuantity({required ProductEntity product}) async {
    final Either<Failure, bool> result = await updateProductQuantityUsecase(
      product,
    );
  }
}
