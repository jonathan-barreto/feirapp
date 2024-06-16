import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/set_product_to_favorite_param.dart';
import 'package:feirapp/src/domain/usecases/get_all_favorite_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_product_by_id_usecase.dart';
import 'package:feirapp/src/domain/usecases/remove_key_usecase.dart';
import 'package:feirapp/src/domain/usecases/set_product_to_favorite_usecase.dart';

class ProductController extends ChangeNotifier {
  final GetProductByIdUsecase getProductByIdUsecase;
  final GetAllFavoriteProductUsecase getAllFavoriteProductUsecase;
  final SetProductToFavoriteUsecase setProductToFavoriteUsecase;
  final RemoveKeyUsecase removeKeyUsecase;

  ProductController({
    required this.getProductByIdUsecase,
    required this.getAllFavoriteProductUsecase,
    required this.setProductToFavoriteUsecase,
    required this.removeKeyUsecase,
  });

  final DebounceService debounce = DebounceServiceImpl();

  bool loading = true;
  bool hasError = false;
  bool productIsFavorite = false;

  int quantity = 0;

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

    checkIfIsFavoriteProduct(productId: productId);

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await getProductByIdUsecase.call(productId);
    response.fold((l) => hasError = true, (r) => product = r.products.first);

    hideLoading();
  }

  void incrementQuantity() {
    quantity = quantity + 1;
    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity > 0) quantity = quantity - 1;
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
      'favorite-products',
    );

    response.fold((l) => hasError = true, (r) => favoriteProducts = r);

    return favoriteProducts;
  }

  Future<void> remove() async {
    final response = await removeKeyUsecase.call('favorite-products');

    response.fold((l) => hasError = true, (r) => null);

    getAllFavoriteProduct();
  }
}
