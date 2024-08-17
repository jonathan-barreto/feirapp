import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/add_button_widget.dart';
import 'package:feirapp/src/core/shared/widgets/internet_image_widget.dart';
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
              product: product,
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
              child: InternetImageWidget(
                url: '${AppEndpoints.baseImage}${product.image}',
                width: AppStyleValues.extraLarge * 3,
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
                    AddButtonWidget(
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
