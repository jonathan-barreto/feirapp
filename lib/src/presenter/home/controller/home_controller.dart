import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/usecases/get_products_with_discount_usecase.dart';
import 'package:feirapp/src/domain/usecases/save_product_to_cart_usecase.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final GetProductsWithDiscountUsecase getProductsWithDiscountUsecase;
  final SaveProductToCartUsecase saveProductToCartUsecase;

  HomeController({
    required this.getProductsWithDiscountUsecase,
    required this.saveProductToCartUsecase,
  });

  bool loading = true;
  List<ProductEntity> products = [];

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<void> init() async {
    await getProductsWithDiscount();
  }

  Future<void> getProductsWithDiscount() async {
    showLoading();

    final NoParams noParams = NoParams();

    final result = await getProductsWithDiscountUsecase.call(
      noParams,
    );

    result.fold((l) => null, (r) => products = r);

    hideLoading();
  }

  Future<String?> addProductInCart({required ProductEntity product}) async {
    String? errorMessage;

    final Either<Failure, bool> result = await saveProductToCartUsecase(
      product,
    );

    result.fold((l) => null, (r) => null);

    return errorMessage;
  }
}
