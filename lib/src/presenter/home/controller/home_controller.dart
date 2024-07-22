import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/usecases/get_products_with_discount_usecase.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final GetProductsWithDiscountUsecase getProductsWithDiscountUsecase;

  HomeController({
    required this.getProductsWithDiscountUsecase,
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

  // Future<void> addProductInCart({required ProductEntity product}) async {
  //   print(product.name);
  // }
}
