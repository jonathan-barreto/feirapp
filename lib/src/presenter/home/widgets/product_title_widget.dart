import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

class ProductTitleWidget extends StatelessWidget {
  final String productName;

  const ProductTitleWidget({
    super.key,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            productName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryColorText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
