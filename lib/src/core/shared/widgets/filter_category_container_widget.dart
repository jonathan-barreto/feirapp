import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/enums/product_category_enum.dart';
import 'package:sabor_natural_app/src/domain/entities/category_tile_entity.dart';

class FilterCategoryContainerWidget extends StatelessWidget {
  const FilterCategoryContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    ProductCategoryEnum? category = ProductCategoryEnum.todos;

    final List<CategoryTileEntity> categories = [
      CategoryTileEntity(
        title: 'Todos',
        category: ProductCategoryEnum.todos,
      ),
      CategoryTileEntity(
        title: 'Frutas',
        category: ProductCategoryEnum.fruta,
      ),
      CategoryTileEntity(
        title: 'Verduras',
        category: ProductCategoryEnum.verdura,
      ),
      CategoryTileEntity(
        title: 'Vegetais',
        category: ProductCategoryEnum.vegetal,
      ),
      CategoryTileEntity(
        title: 'Temperos',
        category: ProductCategoryEnum.tempero,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(
        StyleValues.normal,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          StyleValues.normal,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            StyleValues.smaller,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleValues.normal,
              ),
              child: Row(
                children: [
                  Text(
                    'Categoria',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColorText,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: StyleValues.normal,
              ),
              child: Divider(
                color: AppColors.secondColorText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleValues.normal,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Radio<ProductCategoryEnum>(
                        value: categories[index].category,
                        activeColor: AppColors.primary,
                        groupValue: category,
                        onChanged: (value) {
                          // setState(() {
                          //   category = value;
                          // });
                        },
                      ),
                      Expanded(
                        child: Text(
                          categories[index].title,
                          style: textTheme.bodySmall?.copyWith(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
