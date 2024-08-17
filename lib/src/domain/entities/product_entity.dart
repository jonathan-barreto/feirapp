import 'dart:convert';

class ProductEntity {
  final int id;
  final String name;
  final String price;
  final String? discountPrice;
  final String category;
  final String unit;
  final String? weight;
  final String image;
  int quantity;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    this.discountPrice,
    required this.category,
    required this.unit,
    this.weight,
    required this.image,
    this.quantity = 1,
  });

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      discountPrice: map['discount_price'],
      category: map['category'],
      unit: map['unit'],
      weight: map['weight'],
      image: map['image'],
      quantity: map['quantity'],
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
    map['quantity'] = quantity;

    return map;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
