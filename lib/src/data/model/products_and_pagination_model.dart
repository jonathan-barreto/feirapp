import 'dart:convert';

import 'package:feirapp/src/data/model/product_model.dart';
import 'package:feirapp/src/domain/entities/products_and_pagination_entity.dart';

class ProductsAndPaginationModel {
  final List<ProductModel>? products;
  final String? nextPageUrl;

  ProductsAndPaginationModel({
    required this.products,
    required this.nextPageUrl,
  });

  factory ProductsAndPaginationModel.fromMap(Map<String, dynamic> map) {
    final List? list = map['data'];

    return ProductsAndPaginationModel(
      products: list?.map((e) => ProductModel.fromMap(e)).toList(),
      nextPageUrl: map['next_page_url'],
    );
  }

  factory ProductsAndPaginationModel.fromEntity(
    ProductsAndPaginationEntity entity,
  ) {
    return ProductsAndPaginationModel(
      products: entity.products.map((e) => ProductModel.fromEntity(e)).toList(),
      nextPageUrl: entity.nextPageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = products?.map((e) => e.toMap());
    map['next_page_url'] = nextPageUrl;

    return map;
  }

  ProductsAndPaginationEntity toEntity() {
    return ProductsAndPaginationEntity(
      products: products?.map((e) => e.toEntity()).toList() ?? [],
      nextPageUrl: nextPageUrl,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
