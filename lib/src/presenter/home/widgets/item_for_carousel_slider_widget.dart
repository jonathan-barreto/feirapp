import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';

class ItemForCarouselSlider extends StatelessWidget {
  final String image;

  const ItemForCarouselSlider({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        StyleValues.small,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            StyleValues.normal,
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
