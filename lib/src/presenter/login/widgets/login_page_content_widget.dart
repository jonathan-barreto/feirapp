import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/presenter/login/widgets/email_field_widget.dart';
import 'package:feirapp/src/presenter/login/widgets/login_button.dart';
import 'package:feirapp/src/presenter/login/widgets/login_row_options_widget.dart';
import 'package:feirapp/src/presenter/login/widgets/login_title_widget.dart';
import 'package:feirapp/src/presenter/login/widgets/password_field_widget.dart';
import 'package:feirapp/src/presenter/login/widgets/register_line_widget.dart';

class LoginPageContentWidget extends StatelessWidget {
  final bool isKeyboardVisible;
  final VoidCallback loginOnPressed;
  final void Function(String) emailOnChanged;
  final void Function(String) passwordOnChanged;
  final VoidCallback registerOnPressed;

  const LoginPageContentWidget({
    super.key,
    required this.isKeyboardVisible,
    required this.loginOnPressed,
    required this.emailOnChanged,
    required this.passwordOnChanged,
    required this.registerOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginTitleWidget(),
                const SizedBox(
                  height: StyleValues.large,
                ),
                EmailFieldWidget(
                  onChanged: (value) => emailOnChanged(value),
                ),
                PasswordFieldWidget(
                  onChanged: (value) => passwordOnChanged(value),
                ),
                const LoginRowOptionsWidget(),
                const SizedBox(
                  height: StyleValues.large,
                ),
                LoginButton(
                  onPressed: loginOnPressed,
                ),
                // const SizedBox(
                //   height: StyleValues.large,
                // ),
                // const LoginDividerRowWidget(),
                // const SizedBox(
                //   height: StyleValues.large,
                // ),
                // const RowLoginOptionsWidget(),
                // const SizedBox(
                //   height: StyleValues.large,
                // ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: !isKeyboardVisible,
          child: RegisterLineWidget(
            registerOnPressed: registerOnPressed,
          ),
        ),
        const SizedBox(
          height: StyleValues.small,
        ),
      ],
    );
  }
}
