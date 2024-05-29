import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class PriceContainerWidget extends StatelessWidget {
  final String value;

  const PriceContainerWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleValues.smaller,
      ),
      child: Container(
        height: StyleValues.extraLarge,
        decoration: BoxDecoration(
          border: Border.all(
            
          ),
          borderRadius: BorderRadius.circular(
            StyleValues.small,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleValues.smaller,
              ),
              child: Text(
                'R\$',
                style: textTheme.bodyMedium?.copyWith(
                  
                ),
              ),
            ),
            Expanded(
              child: AutoSizeText(
                value,
                maxLines: 1,
                style: textTheme.bodyMedium?.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
