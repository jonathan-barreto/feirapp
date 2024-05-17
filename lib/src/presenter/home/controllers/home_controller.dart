import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/usecase/usecase.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_discounted_products_usecase.dart';

class HomeController extends ChangeNotifier {
  final GetDiscountedProductsUsecase getDiscountedProductsUsecase;

  HomeController({
    required this.getDiscountedProductsUsecase,
  });

  bool loading = true;
  bool hasError = false;

  List<ProductEntity> products = [];

  Future<void> init() async {
    await getDiscountedProducts();
  }

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<void> getDiscountedProducts() async {
    ProductDataEntity? productDataEntity;

    showLoading();

    await Future.delayed(
      const Duration(seconds: 1),
    );

    final NoParams noParams = NoParams();

    final response = await getDiscountedProductsUsecase.call(
      noParams,
    );

    response.fold((l) => hasError = true, (r) => productDataEntity = r);

    if (productDataEntity != null) {
      products = productDataEntity?.products ?? [];
      notifyListeners();
    }

    hideLoading();
  }

  // Future<void> addProductInCart({required ProductEntity product}) async {
  //   print(product.name);
  // }
}
