import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class FilterButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const FilterButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: StyleValues.extraLarge * 1.25,
        height: StyleValues.extraLarge * 1.15,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(
            StyleValues.small,
          ),
        ),
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.list,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
