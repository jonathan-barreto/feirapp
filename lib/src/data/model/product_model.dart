import 'dart:convert';

import 'package:feirapp/src/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.discountPrice,
    required super.category,
    required super.unit,
    required super.weight,
    required super.image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      discountPrice: map['discount_price'],
      category: map['category'],
      unit: map['unit'],
      weight: map['weight'],
      image: map['image'],
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      discountPrice: entity.discountPrice,
      category: entity.category,
      unit: entity.unit,
      weight: entity.weight,
      image: entity.image,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['discount_price'] = discountPrice;
    map['category'] = category;
    map['unit'] = unit;
    map['weight'] = weight;
    map['image'] = image;

    return map;
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      discountPrice: discountPrice,
      category: category,
      unit: unit,
      weight: weight,
      image: image,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
