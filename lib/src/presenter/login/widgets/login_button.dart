import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
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
        horizontal: StyleValues.small,
      ),
      child: SizedBox(
        height: StyleValues.extraLarge,
        width: double.infinity,
        child: ElevatedButtonCustom(
          text: 'Entrar',
          onPressed: onPressed,
        ),
      ),
    );
  }
}
