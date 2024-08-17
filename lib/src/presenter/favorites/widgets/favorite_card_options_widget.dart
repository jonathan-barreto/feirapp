import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/add_button_widget.dart';
import 'package:flutter/material.dart';

class FavoriteCardOptionsWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const FavoriteCardOptionsWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddButtonWidget(
          onPressed: onPressed,
        ),
        const SizedBox(
          height: AppStyleValues.small,
        ),
      ],
    );
  }
}
