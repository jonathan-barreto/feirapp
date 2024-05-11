import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/card_product_widget.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';

class SliverGridProductsWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const SliverGridProductsWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight) / 2;
    final double itemWidth = size.width / 2;

    return SliverPadding(
      padding: const EdgeInsets.all(
        StyleValues.small,
      ),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: StyleValues.small,
          crossAxisSpacing: StyleValues.small,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return CardProductWidget(
            product: product,
            addProductFunction: () async {
              // await store.addProductInCart(
              //   product: product,
              // );
            },
          );
        },
      ),
    );
  }
}