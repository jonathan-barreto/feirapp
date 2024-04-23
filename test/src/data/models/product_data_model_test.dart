import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sabor_natural_app/src/data/model/page_link_model.dart';
import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
import 'package:sabor_natural_app/src/data/model/product_model.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';

import '../../../mocks/product_data_model_mock.dart';

void main() {
  const ProductModel productModel = ProductModel(
    id: 1,
    name: "Abacate",
    category: "fruta",
    unit: "unidade",
    price: "0.99",
    image: "abacate.png",
  );

  const PageLinkModel pageLinkModel = PageLinkModel(
    first: 'http://127.0.0.1:8000/api/products?page=1',
    next: 'http://127.0.0.1:8000/api/products?page=2',
  );

  const ProductDataModel productDataModel = ProductDataModel(
    productsModel: [productModel],
    linksModel: pageLinkModel,
  );

  test('check if is a subclass of productDataEntity', () async {
    expect(productDataModel, isA<ProductDataEntity>());
  });

  test('should return a valid model', () {
    final json = jsonDecode(productDataModelMock);

    final result = ProductDataModel.fromJson(json);

    expect(result, productDataModel);
  });

  test('should return a valid map', () {
    final Map<String, dynamic> expectMap = {
      "data": [
        {
          "id": 1,
          "name": "Abacate",
          "category": "fruta",
          "unit": "unidade",
          "price": "0.99",
          "image": "abacate.png"
        }
      ],
      "links": {
        "first": "http://127.0.0.1:8000/api/products?page=1",
        "next": "http://127.0.0.1:8000/api/products?page=2"
      },
    };

    final Map<String, dynamic> result = productDataModel.toJson();

    expect(result, expectMap);
  });
}
