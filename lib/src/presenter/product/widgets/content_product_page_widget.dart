import 'package:cached_network_image/cached_network_image.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/extensions/string_converter_to_brl_extension.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/core/shared/widgets/text_on_the_left_widget.dart';
import 'package:feirapp/src/presenter/product/widgets/increment_or_decrement_quantity_widget.dart';
import 'package:feirapp/src/presenter/product/widgets/product_category_and_rating_stars_widget.dart';
import 'package:feirapp/src/presenter/product/widgets/save_and_add_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';

class ContentProductPage extends StatelessWidget {
  final bool isFavorite;
  final ProductEntity? product;
  final String productPrice;
  final String quantity;
  final VoidCallback increment;
  final VoidCallback decrement;
  final VoidCallback saveOnPressed;

  const ContentProductPage({
    super.key,
    required this.isFavorite,
    required this.product,
    required this.productPrice,
    required this.quantity,
    required this.increment,
    required this.decrement,
    required this.saveOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: '${AppEndpoints.baseImage}${product?.image}',
            errorWidget: (context, url, error) => const Icon(Icons.error),
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return const StandardLoadingWidget();
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppStyleValues.normal,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      TextOnTheLeftWidget(
                        text: product?.name ?? '',
                        style: theme.textTheme.titleMedium?.copyWith(),
                      ),
                      ProductCategoryAndRatingStarsWidget(
                        category: product?.category ?? '',
                        rating: 0,
                      ),
                      const SizedBox(
                        height: AppStyleValues.large,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextOnTheLeftWidget(
                              text: productPrice.converterToBRL(),
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          IncrementOrDecrementQuantityWidget(
                            quantity: quantity,
                            increment: increment,
                            decrement: decrement,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppStyleValues.largeMedium,
                      ),
                      TextOnTheLeftWidget(
                        text: 'Sobre o produto',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: AppStyleValues.normal,
                      ),
                      Text(
                        'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos.',
                        overflow: TextOverflow.fade,
                        style: theme.textTheme.bodySmall?.copyWith(),
                      ),
                    ],
                  ),
                ),
                SaveAndAddButtonWidget(
                  isFavorite: isFavorite,
                  saveOnPressed: saveOnPressed,
                  addOnPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
