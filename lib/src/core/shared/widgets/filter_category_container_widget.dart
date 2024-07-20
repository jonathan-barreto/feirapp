import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class FilterCategoryContainerWidget extends StatelessWidget {
  final List<CategoryEntity> categories;
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
        horizontal: AppStyleValues.normal,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(
            AppStyleValues.smaller,
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
                      horizontal: AppStyleValues.small,
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
