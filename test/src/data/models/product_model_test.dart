import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:feirapp/src/data/model/product_model.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';

import '../../../mocks/product_model_mock.dart';

void main() {
  const ProductModel productModel = ProductModel(
    id: 1,
    name: "Abacate",
    category: "fruta",
    unit: "unidade",
    price: "0.99",
    image: "abacate.png",
  );

  test('check if is a subclass of productEntity', () async {
    expect(productModel, isA<ProductEntity>());
  });

  test('should return a valid model', () {
    final json = jsonDecode(productModelMock);

    final result = ProductModel.fromJson(json);

    expect(result, productModel);
  });

  test('should return a valid map', () {
    final Map<String, dynamic> expectMap = {
      "id": 1,
      "name": "Abacate",
      "category": "fruta",
      "unit": "unidade",
      "price": "0.99",
      "image": "abacate.png"
    };

    final Map<String, dynamic> result = productModel.toJson();

    expect(result, expectMap);
  });
}
