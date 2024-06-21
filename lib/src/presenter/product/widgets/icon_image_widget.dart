import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';

class IconImageWidget extends StatelessWidget {
  final String image;

  const IconImageWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(
        StyleValues.smaller,
      ),
      child: Image.asset(
        image,
        width: StyleValues.large,
        color: AppColors.primary,
      ),
    );
  }
}
