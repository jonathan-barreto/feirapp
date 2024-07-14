import 'dart:convert';

import 'package:feirapp/src/data/model/product_model.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';

class ProductDataModel {
  final List<ProductModel>? data;
  final String? message;

  ProductDataModel({
    required this.data,
    required this.message,
  });

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    final List? list = map['data'];

    return ProductDataModel(
      data: list?.map((e) => ProductModel.fromMap(e)).toList(),
      message: map['message'],
    );
  }

  factory ProductDataModel.fromEntity(ProductDataEntity entity) {
    return ProductDataModel(
      data: entity.products.map((e) => ProductModel.fromEntity(e)).toList(),
      message: entity.message,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = data?.map((e) => e.toMap()).toList();
    map['message'] = message;

    return map;
  }

  ProductDataEntity toEntity() {
    return ProductDataEntity(
      products: data?.map((e) => e.toEntity()).toList() ?? [],
      message: message,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
