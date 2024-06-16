import 'package:flutter/material.dart';
import 'package:feirapp/src/presenter/search/widgets/filter_section_text_widget.dart';

class FilterExpansionTileWidget extends StatelessWidget {
  final String label;
  final Widget child;

  const FilterExpansionTileWidget({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).colorScheme.secondary,
      iconColor: Theme.of(context).colorScheme.secondary,
      shape: const Border(),
      title: FilterSectionTextWidget(
        label: label,
      ),
      children: [
        child,
      ],
    );
  }
}
