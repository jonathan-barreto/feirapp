import 'package:auto_size_text/auto_size_text.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class ProductUnitAndWeightWidget extends StatelessWidget {
  final String productUnit;
  final String? productWeight;

  const ProductUnitAndWeightWidget({
    super.key,
    required this.productUnit,
    required this.productWeight,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            productUnit,
            style: textTheme.bodySmall?.copyWith(
              fontSize: AppStyleValues.smaller,
            ),
          ),
        ),
        Visibility(
          visible: productWeight != null,
          child: AutoSizeText(
            '(Aprox. $productWeight)',
            maxLines: 1,
            style: textTheme.bodySmall?.copyWith(
              fontSize: AppStyleValues.smaller,
            ),
          ),
        ),
      ],
    );
  }
}
