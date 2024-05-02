import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class ItemForCarouselSlider extends StatelessWidget {
  final Color color;

  const ItemForCarouselSlider({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        StyleValues.small,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            StyleValues.normal,
          ),
        ),
      ),
    );
  }
}
