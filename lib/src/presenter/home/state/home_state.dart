import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';

class HomeState {
  final List<ProductEntity> products;
  // final bool moreProductLoading;
  // final bool searchProductLoading;

  HomeState({
    required this.products,
    // required this.moreProductLoading,
    // required this.searchProductLoading,
  });

  factory HomeState.initial() {
    return HomeState(
      products: [],
      // moreProductLoading: true,
      // searchProductLoading: false,
    );
  }

  factory HomeState.getDiscountedProducts({
    required List<ProductEntity> listProducts,
    // required bool moreProductLoading,
    // required bool productLoading,
  }) {
    return HomeState(
      products: listProducts,
      // moreProductLoading: moreProductLoading,
      // searchProductLoading: productLoading,
    );
  }

  HomeState copyWith({
    List<ProductEntity>? products,
    // int? totalItemsInCart,
    // bool? moreProductLoading,
    // bool? productLoading,
  }) {
    return HomeState(
      products: products ?? this.products,
      // moreProductLoading: moreProductLoading ?? this.moreProductLoading,
      // searchProductLoading: productLoading ?? searchProductLoading,
    );
  }
}
