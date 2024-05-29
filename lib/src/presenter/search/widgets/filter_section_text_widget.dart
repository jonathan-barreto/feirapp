import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

class FilterSectionTextWidget extends StatelessWidget {
  final String label;

  const FilterSectionTextWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
