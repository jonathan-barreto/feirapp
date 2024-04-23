import 'package:sabor_natural_app/src/data/model/page_link_model.dart';
import 'package:sabor_natural_app/src/data/model/product_model.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';

class ProductDataModel extends ProductDataEntity {
  final List<ProductModel> productsModel;
  final PageLinkModel linksModel;

  const ProductDataModel({
    required this.productsModel,
    required this.linksModel,
  }) : super(products: productsModel, links: linksModel);

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      productsModel: (json['data'] as List).map((e) {
        return ProductModel.fromJson(e);
      }).toList(),
      linksModel: PageLinkModel.fromJson(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['data'] = productsModel.map((e) => e.toJson()).toList();
    data['links'] = linksModel.toJson();

    return data;
  }
}
