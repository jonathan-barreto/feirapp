import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';

class ActionButtonWidget extends StatelessWidget {
  final bool isAdd;
  final VoidCallback onPressed;

  const ActionButtonWidget({
    super.key,
    this.isAdd = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(
            AppStyleValues.normal,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: isAdd ? colorScheme.secondary : colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isAdd ? Icons.add : Icons.remove,
              size: AppStyleValues.largeMedium,
              color: isAdd ? colorScheme.primary : colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
