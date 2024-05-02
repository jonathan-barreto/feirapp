import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToCartButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            StyleValues.smaller + 2,
          ),
          child: Text(
            'Adicionar',
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
