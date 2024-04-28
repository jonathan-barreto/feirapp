import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/descounted_product_card.dart';

class ListViewDescountedProducts extends StatelessWidget {
  final List<ProductEntity> products;

  const ListViewDescountedProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (screenWidth / (screenHeight / 1.5)),
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return DescountedProductCard(
          product: product,
        );
      },
    );
  }
}
