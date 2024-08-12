import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/input/widget/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputAndFilterButtonWidget extends StatelessWidget {
  final VoidCallback openFilterOnPressed;
  final void Function(String?) onChanged;

  const InputAndFilterButtonWidget({
    super.key,
    required this.openFilterOnPressed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.small,
        vertical: AppStyleValues.normal,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            AppStyleValues.normal,
          ),
          bottomRight: Radius.circular(
            AppStyleValues.normal,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: InputWidget(
              onChanged: (String? value) => onChanged(value),
            ),
          ),
          const SizedBox(
            width: AppStyleValues.small,
          ),
          GestureDetector(
            onTap: openFilterOnPressed,
            child: Container(
              width: AppStyleValues.extraLarge * 1.5,
              height: AppStyleValues.extraLarge * 1.5,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(
                  AppStyleValues.normal,
                ),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.list,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
