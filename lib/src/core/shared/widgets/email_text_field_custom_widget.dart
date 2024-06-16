import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:flutter/material.dart';

class EmailTextFieldCustom extends StatefulWidget {
  final void Function(String) onChanged;

  const EmailTextFieldCustom({
    super.key,
    required this.onChanged,
  });

  @override
  State<EmailTextFieldCustom> createState() => _EmailTextFieldCustomState();
}

class _EmailTextFieldCustomState extends State<EmailTextFieldCustom> {
  final TextEditingController controller = TextEditingController();

  bool showClear = false;

  void clearText() {
    controller.clear();

    setState(() {
      showClear = false;
    });
  }

  void onChanged(String value) {
    setState(() {
      showClear = value.isEmpty ? false : true;
    });

    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.top,
      style: themeData.textTheme.bodySmall?.copyWith(
        color: AppColors.darkGrey,
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      cursorColor: AppColors.darkGrey,
      decoration: InputDecoration(
        hintText: 'Insira seu email...',
        hintStyle: themeData.textTheme.bodySmall?.copyWith(),
        isDense: true,
        prefixIcon: const Icon(
          Icons.email_outlined,
          size: StyleValues.large,
          color: AppColors.darkGrey,
        ),
        suffixIcon: Visibility(
          visible: showClear,
          child: IconButton(
            onPressed: clearText,
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGrey,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGrey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGrey,
          ),
        ),
      ),
      onChanged: (value) => onChanged(value),
    );
  }
}
