import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class FilterElevatedButton extends StatelessWidget {
  final bool isBorded;
  final String label;
  final VoidCallback onPressed;

  const FilterElevatedButton({
    super.key,
    this.isBorded = false,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    const whiteColor = MaterialStatePropertyAll(AppColors.white);
    const grenColor = MaterialStatePropertyAll(AppColors.primary);

    return SizedBox(
      height: screenHeight * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: isBorded ? whiteColor : grenColor,
          side: const MaterialStatePropertyAll(
            BorderSide(
              color: AppColors.primary,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppStyleValues.small,
              ),
            ),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isBorded ? AppColors.primary : AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
