import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback saveProductOnPressed;


  const FavoriteIconWidget({
    super.key,
    required this.isFavorite,
    required this.saveProductOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    const bookmarkFilled = Icons.bookmark_border;
    const bookmark = Icons.bookmark_outlined;

    return IconButton(
      onPressed: saveProductOnPressed,
      icon: Icon(
        isFavorite ? bookmark : bookmarkFilled,
        color: AppColors.primary,
        size: AppStyleValues.largeMedium,
      ),
    );
  }
}
