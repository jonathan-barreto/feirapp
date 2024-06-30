import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RatingStarsWidget extends StatelessWidget {
  final int rating;

  const RatingStarsWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? AppColors.primary : AppColors.darkGrey,
        );
      }),
    );
  }
}