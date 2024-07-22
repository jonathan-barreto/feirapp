import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/extensions/string_converter_to_brl_extension.dart';
import 'package:flutter/material.dart';

class PriceAndWeightWidget extends StatelessWidget {
  final String productPrice;
  final String? productWeight;

  const PriceAndWeightWidget({
    super.key,
    required this.productPrice,
    required this.productWeight,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: '${productPrice.converterToBRL()} ',
        style: theme.textTheme.titleSmall?.copyWith(
          color: AppColors.primary,
        ),
        children: [
          TextSpan(
            text: productWeight != null ? 'Aprox ($productWeight)' : '',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
