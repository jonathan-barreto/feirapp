import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';

class RegisterLineWidget extends StatelessWidget {
  const RegisterLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Não tem uma conta?',
          style: themeData.textTheme.bodySmall?.copyWith(),
        ),
        InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          child: Text(
            ' Registre-se',
            style: themeData.textTheme.bodySmall?.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
