import 'dart:convert';

import 'package:feirapp/src/data/model/product_model.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';

class ProductDataModel extends ProductDataEntity {
  final List<ProductModel> productsModel;

  const ProductDataModel({
    required this.productsModel,
    required super.link,
  }) : super(products: productsModel);

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    final bool linksIsNotNull = json['next_page_url'] != null;

    return ProductDataModel(
      productsModel: (json['data'] as List).map((e) {
        return ProductModel.fromJson(e);
      }).toList(),
      link: linksIsNotNull ? json['next_page_url'] : null,
    );
  }

  factory ProductDataModel.fromEntity(ProductDataEntity entity) {
    return ProductDataModel(
      productsModel: entity.products.map((e) {
        return ProductModel.fromEntity(e);
      }).toList(),
      link: entity.link,
    );
  }

  ProductDataEntity toEntity() {
    return ProductDataEntity(
      products: productsModel,
      link: link,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    data['data'] = productsModel.map((e) => e.toJson()).toList();
    data['links'] = link;

    return data;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
