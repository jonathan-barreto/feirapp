import 'package:cached_network_image/cached_network_image.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/extensions/string_converter_to_brl_extension.dart';
import 'package:feirapp/src/core/shared/extensions/upper_case_first_letter_extension.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.smaller,
        vertical: AppStyleValues.small,
      ),
      child: Container(
        width: double.infinity,
        height: AppStyleValues.extraLarge * 2.5,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            AppStyleValues.small,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.mediumGrey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: AppStyleValues.extraLarge * 2.5,
              child: CachedNetworkImage(
                imageUrl: '${AppEndpoints.baseImage}${product.image}',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return const StandardLoadingWidget();
                },
              ),
            ),
            const SizedBox(
              width: AppStyleValues.extraSmaller,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (product.discountPrice ?? product.price).converterToBRL(),
                    maxLines: 1,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    product.category.upperCaseFirstLetter(),
                    maxLines: 1,
                    style: theme.textTheme.bodySmall?.copyWith(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
