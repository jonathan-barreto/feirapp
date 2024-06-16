import 'package:flutter/material.dart';

class LoginRowOptionsWidget extends StatelessWidget {
  const LoginRowOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        Expanded(
          child: Text(
            'Lembrar-me',
            style: themeData.textTheme.bodySmall?.copyWith(),
          ),
        ),
        Expanded(
          child: Text(
            'Esqueceu a senha?',
            style: themeData.textTheme.bodySmall?.copyWith(),
          ),
        ),
      ],
    );
  }
}