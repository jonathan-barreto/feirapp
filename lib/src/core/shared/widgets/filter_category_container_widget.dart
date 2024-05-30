import 'package:flutter/material.dart';

import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/domain/entities/category_tile_entity.dart';

class FilterCategoryContainerWidget extends StatelessWidget {
  final List<CategoryTileEntity> categories;
  final void Function(int) onChange;

  const FilterCategoryContainerWidget({
    super.key,
    required this.categories,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    bool? category = categories.any((element) => element.isSelected == true);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleValues.normal,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(
            StyleValues.smaller,
          ),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: StyleValues.small,
                    ),
                    child: Text(
                      categories[index].title,
                      style: textTheme.bodySmall?.copyWith(),
                    ),
                  ),
                ),
                Radio<bool>(
                  value: categories[index].isSelected,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: category,
                  onChanged: (value) => onChange(index),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
