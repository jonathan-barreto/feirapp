import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class RemoveButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const RemoveButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: AppStyleValues.extraLarge,
            height: AppStyleValues.extraLarge,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.remove,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
