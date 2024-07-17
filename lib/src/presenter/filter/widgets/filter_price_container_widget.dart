import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class FilterPriceContainerWidget extends StatelessWidget {
  final String title;
  final String label;

  const FilterPriceContainerWidget({
    super.key,
    required this.title,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppStyleValues.extraSmall,
        ),
        Container(
          width: double.maxFinite,
          height: AppStyleValues.extraLarge,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.darkGrey),
            borderRadius: BorderRadius.circular(
              AppStyleValues.small,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}