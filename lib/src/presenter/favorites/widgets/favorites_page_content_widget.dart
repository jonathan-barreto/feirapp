import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/presenter/favorites/widgets/favorite_container_widget.dart';
import 'package:flutter/material.dart';

class FavoritesPageContentWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const FavoritesPageContentWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return FavoriteContainerWidget(
            product: product,
          );
        },
      ),
    );
  }
}
