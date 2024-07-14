import 'dart:convert';

class ProductsFilterParam {
  String? name;
  String? category;
  double? minPrice;
  double? maxPrice;
  String? order;

  ProductsFilterParam({
    this.name,
    this.category,
    this.minPrice,
    this.maxPrice,
    this.order,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['category'] = category;
    data['min_price'] = minPrice;
    data['max_price'] = maxPrice;
    data['order'] = order;

    return data;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
