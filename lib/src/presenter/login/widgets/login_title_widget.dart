import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleValues.small,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Conecte-se',
                style: themeData.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: StyleValues.normal,
              ),
              Image.asset(
                AppAssets.estrelasIcon,
                width: StyleValues.extraLarge,
              )
            ],
          ),
          const SizedBox(
            height: StyleValues.small,
          ),
          Row(
            children: [
              Expanded(
                child: AutoSizeText(
                  'Bem vindo! Por favor insira seus dados.',
                  maxLines: 1,
                  style: themeData.textTheme.bodySmall?.copyWith(
                    color: AppColors.mediumGrey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
