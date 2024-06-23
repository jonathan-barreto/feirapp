import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';

class LoginDividerRowWidget extends StatelessWidget {
  const LoginDividerRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.small,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppStyleValues.normal,
            ),
            child: Text(
              'Ou',
              style: themeData.textTheme.bodySmall?.copyWith(),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
