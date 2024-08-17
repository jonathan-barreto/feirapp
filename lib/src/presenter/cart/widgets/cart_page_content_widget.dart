import 'package:feirapp/src/core/shared/widgets/horizontal_product_card_widget.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/presenter/cart/widgets/cart_page_options_widget.dart';
import 'package:feirapp/src/presenter/cart/widgets/total_cart_container_widget.dart';
import 'package:flutter/material.dart';

class CartPageContentWidget extends StatelessWidget {
  final List<ProductEntity> products;
  final void Function(ProductEntity) addQuantity;
  final void Function(ProductEntity) removeQuantity;

  const CartPageContentWidget({
    super.key,
    required this.products,
    required this.addQuantity,
    required this.removeQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final ProductEntity product = products[index];

              return HorizontalProductCardWidget(
                product: product,
                optionsWidget: CartPageOptionsWidget(
                  productQuantity: '${product.quantity}',
                  addQuantity: () => addQuantity(product),
                  removeQuantity: () => removeQuantity(product),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: TotalCartContainerWidget(
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
