import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterLineWidget extends StatelessWidget {
  final VoidCallback registerOnPressed;

  const RegisterLineWidget({
    super.key,
    required this.registerOnPressed,
  });

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
          onTap: registerOnPressed,
          overlayColor: const WidgetStatePropertyAll(
            AppColors.white,
          ),
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
