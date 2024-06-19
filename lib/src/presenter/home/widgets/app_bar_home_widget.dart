import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';

class AppBarHomeWidget extends StatelessWidget {
  final String name;

  const AppBarHomeWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.1,
      color: themeData.appBarTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: StyleValues.small,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          StyleValues.small,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Olá, $name!',
              maxLines: 1,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: themeData.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
