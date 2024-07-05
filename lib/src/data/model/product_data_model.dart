import 'dart:convert';

import 'package:feirapp/src/data/model/product_model.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';

class ProductDataModel extends ProductDataEntity {
  final List<ProductModel> productsModel;

  const ProductDataModel({
    required this.productsModel,
    required super.link,
  }) : super(products: productsModel);

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    final bool linksIsNotNull = map['next_page_url'] != null;

    return ProductDataModel(
      productsModel: (map['data'] as List).map((e) {
        return ProductModel.fromMap(e);
      }).toList(),
      link: linksIsNotNull ? map['next_page_url'] : null,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = productsModel.map((e) => e.toJson()).toList();
    map['links'] = link;

    return map;
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

  String toJson() {
    return jsonEncode(toMap());
  }
}
