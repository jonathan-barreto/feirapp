import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class BottomLoadingMoreProductsWidget extends StatelessWidget {
  const BottomLoadingMoreProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (MediaQuery.of(context).size.width / 2) - StyleValues.medium,
      bottom: StyleValues.smaller,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: StyleValues.medium,
          height: StyleValues.medium,
          child: SizedBox(
            width: StyleValues.smaller,
            height: StyleValues.smaller,
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
