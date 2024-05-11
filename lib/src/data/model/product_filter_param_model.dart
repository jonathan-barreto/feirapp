import 'package:sabor_natural_app/src/domain/entities/product_filter_param_entity.dart';

class ProductFilterParamModel extends ProductFilterParamEntity {
  const ProductFilterParamModel({
    super.name,
    super.category,
    super.minPrice,
    super.maxPrice,
    super.order,
  });

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
