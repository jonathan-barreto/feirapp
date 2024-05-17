import 'package:sabor_natural_app/src/domain/entities/product_filter_param_entity.dart';

// ignore: must_be_immutable
class ProductFilterParamModel extends ProductFilterParamEntity {
  ProductFilterParamModel({
    super.name,
    super.category,
    super.minPrice,
    super.maxPrice,
    super.order,
  });

  factory ProductFilterParamModel.fromEntity(ProductFilterParamEntity entity) {
    return ProductFilterParamModel(
      name: entity.name,
      category: entity.category,
      minPrice: entity.minPrice,
      maxPrice: entity.maxPrice,
      order: entity.order,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['category'] = category;
    data['min_price'] = minPrice;
    data['max_price'] = maxPrice;
    data['order'] = order;

    return data;
  }
}
