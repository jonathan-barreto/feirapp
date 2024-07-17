import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterDividerWidget extends StatelessWidget {
  final String label;
  final Widget child;

  const FilterDividerWidget({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.angleDown,
            ),
          ],
        ),
        const SizedBox(
          height: AppStyleValues.small,
        ),
        const Divider(
          thickness: AppStyleValues.extraSmall,
        ),
        const SizedBox(
          height: AppStyleValues.small,
        ),
        Column(
          children: [
            child,
          ],
        ),
      ],
    );
  }
}
