import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

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
        backgroundColor: MaterialStatePropertyAll(
          isLight ? AppColors.white : Theme.of(context).primaryColor,
        ),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: Theme.of(context).primaryColor,
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
