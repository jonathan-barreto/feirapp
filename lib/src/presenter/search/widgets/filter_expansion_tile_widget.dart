import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/filter_section_text_widget.dart';

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
