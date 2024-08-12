import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/extensions/string_converter_to_brl_extension.dart';
import 'package:feirapp/src/core/shared/widgets/internet_image_widget.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class FavoriteContainerWidget extends StatelessWidget {
  final ProductEntity product;

  const FavoriteContainerWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: AppStyleValues.extraLarge * 3,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppStyleValues.normal,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyleValues.normal,
        ),
        child: Row(
          children: [
            Expanded(
              child: InternetImageWidget(
                url: '${AppEndpoints.baseImage}${product.image}',
              ),
            ),
            const SizedBox(
              width: AppStyleValues.small,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.unit,
                    maxLines: 1,
                    style: theme.textTheme.bodySmall?.copyWith(),
                  ),
                  Text(
                    (product.discountPrice ?? product.price).converterToBRL(),
                    maxLines: 1,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
