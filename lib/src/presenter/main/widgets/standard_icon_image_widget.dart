import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class StandardIconImageWidget extends StatelessWidget {
  final String imagePath;
  final int iconIndex;
  final int indexSelected;

  const StandardIconImageWidget({
    super.key,
    required this.imagePath,
    required this.iconIndex,
    required this.indexSelected,
  });

  @override
  Widget build(BuildContext context) {
    bool isEqualIndexes = iconIndex == indexSelected;

    return Container(
      decoration: BoxDecoration(
        color: isEqualIndexes ? Theme.of(context).primaryColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(
        StyleValues.smaller,
      ),
      child: Image.asset(
        imagePath,
        width: StyleValues.large,
        color: isEqualIndexes ? AppColors.white : AppColors.black,
      ),
    );
  }
}
