import 'package:flutter/material.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';

class ContentProductPage extends StatelessWidget {
  final ProductEntity? product;
  final String productPrice;
  final String quantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const ContentProductPage({
    super.key,
    required this.product,
    required this.productPrice,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return  Column(
      children: [],
    );
  }
}
