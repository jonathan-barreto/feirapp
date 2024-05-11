import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/core/usecase/usecase.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_discounted_products_usecase.dart';
import 'package:sabor_natural_app/src/presenter/home/home_state.dart';

class HomeStore extends ValueNotifier<RawState> {
  final GetDiscountedProductsUsecase getDiscountedProductsUsecase;

  HomeStore({
    required this.getDiscountedProductsUsecase,
  }) : super(const IdleState());

  Future<void> getDiscountedProducts() async {
    value = const LoadingState();

    await Future.delayed(
      const Duration(seconds: 1),
    );

    final NoParams noParams = NoParams();

    final response = await getDiscountedProductsUsecase.call(
      noParams,
    );

    response.fold(
      (failure) {
        return value = const ErrorState(message: 'deu erro');
      },
      (productData) {
        return value = SuccessState(
          output: HomeState.getDiscountedProducts(
            listProducts: productData.products,
          ),
        );
      },
    );
  }

  Future<void> addProductInCart({required ProductEntity product}) async {
    print(product.name);
  }
}
