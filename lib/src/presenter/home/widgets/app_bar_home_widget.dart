import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';

class AppBarHomeWidget extends StatelessWidget {
  final String name;

  const AppBarHomeWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: AppStyleValues.extraLarge * 1.5,
      color: theme.appBarTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.small,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppStyleValues.small,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Olá, $name!',
              maxLines: 1,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: AppStyleValues.extraLarge + 2,
              height: AppStyleValues.extraLarge + 2,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
