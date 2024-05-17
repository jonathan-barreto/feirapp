import 'package:sabor_natural_app/src/core/shared/enums/product_category_enum.dart';

class CategoryTileEntity {
  final String title;
  final ProductCategoryEnum category;
  bool isSelected;

  CategoryTileEntity({
    required this.title,
    required this.category,
    this.isSelected = false,
  });
}
