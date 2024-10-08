import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustomWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLight;

  const ElevatedButtonCustomWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLight = false,
  });

  const ElevatedButtonCustomWidget.light({
    super.key,
    required this.label,
    required this.onPressed,
  }) : isLight = true;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          isLight ? AppColors.white : Theme.of(context).primaryColor,
        ),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: Theme.of(context).primaryColor,
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
        style: textTheme.bodyMedium?.copyWith(
          color: isLight ? Theme.of(context).primaryColor : AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
