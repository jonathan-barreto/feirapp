import 'package:auto_size_text/auto_size_text.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/core/shared/extensions/get_first_letter_of_user_name_extension.dart';
import 'package:feirapp/src/core/shared/extensions/get_user_first_name_extension.dart';
import 'package:flutter/material.dart';

class ProfileUserDataWidget extends StatelessWidget {
  final String name;

  const ProfileUserDataWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: StyleValues.extraLarge * 1.5,
          child: CircleAvatar(
            backgroundColor: theme.primaryColor,
            child: Text(
              name.getFirstLetterOfName(),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            StyleValues.normal,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                name.getFirstName(),
                style: theme.textTheme.bodyMedium?.copyWith(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
