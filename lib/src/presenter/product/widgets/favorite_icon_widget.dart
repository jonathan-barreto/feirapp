import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/presenter/product/widgets/icon_image_widget.dart';
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
    const String bookmarkFilled = AppAssets.bookmarkFilledIcon;
    const String bookmark = AppAssets.bookmarkIcon;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleValues.small,
      ),
      child: IconButton(
        onPressed: saveProductOnPressed,
        icon: IconImageWidget(
          image: isFavorite ? bookmarkFilled : bookmark,
        ),
      ),
    );
  }
}
