import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

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
              fontSize: StyleValues.smaller,
              
            ),
          ),
        ),
        Visibility(
          visible: productWeight != null,
          child: AutoSizeText(
            '(Aprox. $productWeight)',
            maxLines: 1,
            style: textTheme.bodySmall?.copyWith(
              fontSize: StyleValues.smaller,
              
            ),
          ),
        ),
      ],
    );
  }
}
