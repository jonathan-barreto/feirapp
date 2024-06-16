import 'package:feirapp/src/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.category,
    required super.unit,
    required super.price,
    required super.image,
    super.weight,
    super.discount,
    super.discountPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      unit: json['unit'],
      price: json['price'],
      image: json['image'],
      weight: json['weight'],
      discount: json['discount'],
      discountPrice: json['discount_price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['unit'] = unit;
    data['price'] = price;
    data['image'] = image;
    data['weight'] = weight;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;

    return data;
  }
}
