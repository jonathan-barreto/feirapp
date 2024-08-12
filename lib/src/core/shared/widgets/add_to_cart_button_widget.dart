import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToCartButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: AppStyleValues.extraLarge,
            height: AppStyleValues.extraLarge,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
