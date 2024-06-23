import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/password_text_field_custom.dart';

class PasswordFieldWidget extends StatelessWidget {
  final void Function(String) onChanged;

  const PasswordFieldWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.small,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Senha',
                style: themeData.textTheme.bodyMedium?.copyWith(),
              ),
            ],
          ),
          const SizedBox(
            height: AppStyleValues.small,
          ),
          SizedBox(
            height: AppStyleValues.extraLarge * 2,
            child: PasswordTextFieldCustom(
              onChanged: (value) => onChanged(value),
            ),
          ),
        ],
      ),
    );
  }
}
