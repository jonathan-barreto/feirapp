import 'package:cached_network_image/cached_network_image.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/add_to_cart_button_widget.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/core/shared/widgets/product_price_widget.dart';
import 'package:feirapp/src/core/shared/widgets/product_title_widget.dart';
import 'package:feirapp/src/core/shared/widgets/product_unit_and_weight_widget.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/presenter/product/page/product_page.dart';
import 'package:flutter/material.dart';

class CardProductWidget extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback addProductFunction;

  const CardProductWidget({
    super.key,
    required this.product,
    required this.addProductFunction,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              id: '${product.id}',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            AppStyleValues.small,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CachedNetworkImage(
                width: AppStyleValues.extraLarge * 3,
                imageUrl: '${AppEndpoints.baseApiImage}${product.image}',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return const CircularProgressIndicatorCustom();
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppStyleValues.small,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // DiscountContainerWidget(
                    //   discount: product.discount ?? 0,
                    // ),
                    ProductPriceWidget(
                      price: product.price,
                      discountPrice: product.discountPrice,
                      weight: product.weight,
                    ),
                    ProductTitleWidget(
                      productName: product.name,
                    ),
                    ProductUnitAndWeightWidget(
                      productUnit: product.unit,
                      productWeight: product.weight,
                    ),
                    AddToCartButtonWidget(
                      onPressed: addProductFunction,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
