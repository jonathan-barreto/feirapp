import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class IconImageWidget extends StatelessWidget {
  final String image;

  const IconImageWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(
        StyleValues.smaller,
      ),
      child: Image.asset(
        image,
        width: StyleValues.large,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}