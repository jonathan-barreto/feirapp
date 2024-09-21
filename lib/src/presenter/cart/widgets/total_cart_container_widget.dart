import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/extensions/string_converter_to_brl_extension.dart';
import 'package:feirapp/src/presenter/search/widgets/elevated_button_custom_widget.dart';
import 'package:flutter/material.dart';

class TotalCartContainerWidget extends StatelessWidget {
  final double cartTotal;
  final VoidCallback onPressed;

  const TotalCartContainerWidget({
    super.key,
    required this.cartTotal,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppStyleValues.small,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyleValues.small,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$cartTotal'.converterToBRL(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: AppStyleValues.extraLarge * 1.2,
              child: ElevatedButtonCustomWidget(
                label: 'Confirmar pedido',
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
