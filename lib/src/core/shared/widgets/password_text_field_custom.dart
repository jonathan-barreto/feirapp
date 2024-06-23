import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordTextFieldCustom extends StatefulWidget {
  final void Function(String) onChanged;

  const PasswordTextFieldCustom({
    super.key,
    required this.onChanged,
  });

  @override
  State<PasswordTextFieldCustom> createState() =>
      _PasswordTextFieldCustomState();
}

class _PasswordTextFieldCustomState extends State<PasswordTextFieldCustom> {
  final TextEditingController controller = TextEditingController();

  bool showPassword = false;

  void setShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
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
      maxLength: 8,
      obscureText: !showPassword,
      cursorColor: AppColors.darkGrey,
      decoration: InputDecoration(
        hintText: 'Insira sua senha...',
        hintStyle: themeData.textTheme.bodySmall?.copyWith(),
        isDense: true,
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          size: AppStyleValues.large,
          color: AppColors.darkGrey,
        ),
        suffixIcon: IconButton(
          onPressed: setShowPassword,
          icon: Icon(
            showPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
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
      onChanged: (value) => widget.onChanged(value),
    );
  }
}
