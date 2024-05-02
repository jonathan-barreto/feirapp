import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class RightActionButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const RightActionButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(
              StyleValues.small,
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
