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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      unit: map['unit'],
      price: map['price'],
      image: map['image'],
      weight: map['weight'],
      discount: map['discount'],
      discountPrice: map['discount_price'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['unit'] = unit;
    map['price'] = price;
    map['image'] = image;
    map['weight'] = weight;
    map['discount'] = discount;
    map['discount_price'] = discountPrice;

    return map;
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

  String toJson() {
    return jsonEncode(toMap());
  }
}
