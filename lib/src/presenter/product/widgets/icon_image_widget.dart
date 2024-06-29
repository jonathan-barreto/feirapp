import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';

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
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(
        AppStyleValues.smaller,
      ),
      child: Image.asset(
        image,
        width: AppStyleValues.large,
        color: AppColors.white,
      ),
    );
  }
}
