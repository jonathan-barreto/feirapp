import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class LeftActionButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const LeftActionButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(
            StyleValues.small,
          ),
        ),
        child: const Icon(
          Icons.remove,
          color: AppColors.black,
        ),
      ),
    );
  }
}
