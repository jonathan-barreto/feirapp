import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';

class FilterButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const FilterButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: StyleValues.extraLarge * 1.35,
        height: StyleValues.extraLarge * 1.35,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            StyleValues.small,
          ),
        ),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.list,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
