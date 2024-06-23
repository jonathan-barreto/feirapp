import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/elevated_buttom_custom.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.small,
      ),
      child: SizedBox(
        height: AppStyleValues.extraLarge,
        width: double.infinity,
        child: ElevatedButtonCustom(
          text: 'Entrar',
          onPressed: onPressed,
        ),
      ),
    );
  }
}
