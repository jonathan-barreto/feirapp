import 'package:auto_size_text/auto_size_text.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class IncrementOrDecrementQuantityWidget extends StatelessWidget {
  final String quantity;
  final VoidCallback increment;
  final VoidCallback decrement;

  const IncrementOrDecrementQuantityWidget({
    super.key,
    required this.quantity,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppStyleValues.extraLarge,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.darkGrey,
          ),
          borderRadius: BorderRadius.circular(
            AppStyleValues.small,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: decrement,
                highlightColor: Colors.transparent,
                icon: const Icon(
                  Icons.remove,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyleValues.normal,
              ),
              child: AutoSizeText(
                quantity,
                maxLines: 1,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: increment,
                highlightColor: Colors.transparent,
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
