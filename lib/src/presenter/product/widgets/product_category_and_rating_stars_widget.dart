import 'package:feirapp/src/core/shared/extensions/upper_case_first_letter_extension.dart';
import 'package:feirapp/src/core/shared/widgets/text_on_the_left_widget.dart';
import 'package:feirapp/src/presenter/product/widgets/rating_stars_custom_widget.dart';
import 'package:flutter/material.dart';

class ProductCategoryAndRatingStarsWidget extends StatelessWidget {
  final String category;
  final int rating;

  const ProductCategoryAndRatingStarsWidget({
    super.key,
    required this.category, required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: TextOnTheLeftWidget(
            text: category.upperCaseFirstLetter(),
            style: theme.textTheme.bodyMedium?.copyWith(),
          ),
        ),
         RatingStarsWidget(
          rating: rating,
        ),
      ],
    );
  }
}
