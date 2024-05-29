import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

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
            StyleValues.normal,
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
              size: StyleValues.largeMedium,
              color: isAdd ? colorScheme.primary : colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
