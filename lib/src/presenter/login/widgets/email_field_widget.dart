import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/core/shared/widgets/email_text_field_custom_widget.dart';

class EmailFieldWidget extends StatelessWidget {
  final void Function(String) onChanged;

  const EmailFieldWidget({
    super.key,
    required this.onChanged,
  });

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
                'Email',
                style: themeData.textTheme.bodyMedium?.copyWith(),
              ),
            ],
          ),
          const SizedBox(
            height: StyleValues.small,
          ),
          SizedBox(
            height: StyleValues.extraLarge * 2,
            child: EmailTextFieldCustom(
              onChanged: (value) => onChanged(value),
            ),
          ),
        ],
      ),
    );
  }
}
