import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/set_product_to_favorite_param.dart';
import 'package:feirapp/src/domain/usecases/get_all_favorite_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_product_by_id_usecase.dart';

import 'package:feirapp/src/domain/usecases/set_product_to_favorite_usecase.dart';

class ProductController extends ChangeNotifier {
  final GetProductByIdUsecase getProductByIdUsecase;
  final GetAllFavoriteProductUsecase getAllFavoriteProductUsecase;
  final SetProductToFavoriteUsecase setProductToFavoriteUsecase;

  ProductController({
    required this.getProductByIdUsecase,
    required this.getAllFavoriteProductUsecase,
    required this.setProductToFavoriteUsecase,
  });

  final DebounceService debounce = DebounceServiceImpl();

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

  void chengeProductIsFavorite({required bool value}) {
    productIsFavorite = value;
    notifyListeners();
  }

  Future<void> checkIfIsFavoriteProduct({required String productId}) async {
    final List<String>? favoriteProducts = await getAllFavoriteProduct();

    final isFavorite = favoriteProducts?.contains(productId) ?? false;

    chengeProductIsFavorite(value: isFavorite);
  }

  Future<void> getProduct({required String productId}) async {
    showLoading();

    checkIfIsFavoriteProduct(
      productId: productId,
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await getProductByIdUsecase.call(
      productId,
    );

    response.fold((l) => hasError = true, (r) => product = r.products.first);

    productPrice = product?.discountPrice ?? product?.price;

    hideLoading();
  }

  void _minusOrPlusProductPrice({bool isMinus = false}) {
    final double productPrintDouble = double.parse(
      '$productPrice',
    );

    final double price = double.parse(
      product?.discountPrice ?? (product?.price ?? ''),
    );

    late final double finalValue;

    if (isMinus) {
      finalValue = productPrintDouble - price;
    } else {
      finalValue = productPrintDouble + price;
    }

    productPrice = '$finalValue';
  }

  void incrementQuantity() {
    quantity = quantity + 1;

    _minusOrPlusProductPrice();

    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity = quantity - 1;

      _minusOrPlusProductPrice(
        isMinus: true,
      );
    }

    notifyListeners();
  }

  Future<void> _setStringList({required List<String> products}) async {
    final SetProductToFavoriteParam params = SetProductToFavoriteParam(
      key: 'favorite-products',
      products: products,
    );

    final response = await setProductToFavoriteUsecase.call(params);

    response.fold((l) => hasError = true, (r) => null);
  }

  List<String> removeProductId({
    required List<String> favoriteProducts,
    required String productIdToRemove,
  }) {
    final productIndex = favoriteProducts.indexWhere((element) {
      return element == productIdToRemove;
    });

    favoriteProducts.removeAt(productIndex);

    return favoriteProducts;
  }

  Future<void> saveProductToFavorites({required String productId}) async {
    final List<String>? favoriteProducts = await getAllFavoriteProduct();

    if (favoriteProducts == null) {
      _setStringList(products: [productId]);

      chengeProductIsFavorite(value: true);

      return;
    }

    // final bool productIsFavorite = favoriteProducts.contains(
    //   productId,
    // );

    // if (productIsFavorite == true) {
    //   final List<String> newFavoriteProducts = removeProductId(
    //     favoriteProducts: favoriteProducts,
    //     productIdToRemove: productId,
    //   );

    //   _setStringList(list: newFavoriteProducts);

    //   chengeProductIsFavorite(value: false);
    // } else {
    //   favoriteProducts.add(productId);

    //   _setStringList(list: favoriteProducts);

    //   chengeProductIsFavorite(value: true);
    // }
  }

  Future<List<String>?> getAllFavoriteProduct() async {
    List<String>? favoriteProducts;

    final response = await getAllFavoriteProductUsecase.call(
      NoParams(),
    );

    response.fold((l) => hasError = true, (r) => favoriteProducts = r);

    return favoriteProducts;
  }
}
