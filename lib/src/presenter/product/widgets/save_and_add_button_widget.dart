import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/elevated_buttom_custom.dart';
import 'package:feirapp/src/presenter/product/widgets/favorite_icon_widget.dart';
import 'package:flutter/material.dart';

class SaveAndAddButtonWidget extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback saveOnPressed;
  final VoidCallback addOnPressed;

  const SaveAndAddButtonWidget({
    super.key,
    required this.isFavorite,
    required this.saveOnPressed,
    required this.addOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: AppStyleValues.extraLarge,
            height: AppStyleValues.extraLarge,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.darkGrey,
              ),
              borderRadius: BorderRadius.circular(
                AppStyleValues.small,
            ),
              ),
            child: FavoriteIconWidget(
              isFavorite: isFavorite,
              saveProductOnPressed: saveOnPressed,
            ),
          ),
          const SizedBox(
            width: AppStyleValues.small,
          ),
          Expanded(
            child: SizedBox(
              height: AppStyleValues.extraLarge,
              child: ElevatedButtonCustom(
                text: 'Adicionar',
                onPressed: addOnPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
