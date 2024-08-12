import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class FavoriteInputWidget extends StatelessWidget {
  const FavoriteInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextField(
      style: theme.textTheme.bodyMedium?.copyWith(),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: const OutlineInputBorder(),
        hintText: 'Pesquisar...',
        hintStyle: theme.textTheme.bodyMedium?.copyWith(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.mediumGrey,
          ),
          borderRadius: BorderRadius.circular(
            AppStyleValues.smaller,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.mediumGrey,
          ),
          borderRadius: BorderRadius.circular(
            AppStyleValues.smaller,
          ),
        ),
      ),
    );
  }
}
