import 'dart:convert';

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

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      category: entity.category,
      unit: entity.unit,
      price: entity.price,
      image: entity.image,
      weight: entity.weight,
      discount: entity.discount,
      discountPrice: entity.discountPrice,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      category: category,
      unit: unit,
      price: price,
      image: image,
      weight: weight,
      discount: discount,
      discountPrice: discountPrice,
    );
  }

  Map<String, dynamic> toMap() {
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

  String toJson() {
    return jsonEncode(toMap());
  }
}
