import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';

class BottomLoadingMoreProductsWidget extends StatelessWidget {
  const BottomLoadingMoreProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (MediaQuery.of(context).size.width / 2) - AppStyleValues.medium,
      bottom: AppStyleValues.smaller,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: AppStyleValues.medium,
          height: AppStyleValues.medium,
          child: SizedBox(
            width: AppStyleValues.smaller,
            height: AppStyleValues.smaller,
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
