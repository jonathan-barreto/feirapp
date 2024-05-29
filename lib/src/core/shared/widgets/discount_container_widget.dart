import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

class DiscountContainerWidget extends StatelessWidget {
  final int discount;

  const DiscountContainerWidget({
    super.key,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.15,
          height: screenHeight * 0.04,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.redAccent,
            ),
          ),
          child: Center(
            child: Text(
              '$discount% off',
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
