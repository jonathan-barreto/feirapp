import 'dart:convert';

import 'package:sabor_natural_app/src/core/errors/exceptions.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client.dart';
import 'package:sabor_natural_app/src/core/shared/constants/endpoints.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
import 'package:sabor_natural_app/src/data/model/product_data_model.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final HttpClient httpClient;

  ProductDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<ProductDataModel> getAllProducts() async {
    final response = await httpClient.get(
      endpoint: EndPoints.getAllProducts,
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        jsonDecode(response.data),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataModel> getProductsByName({
    required String productName,
  }) async {
    final response = await httpClient.get(
      endpoint: EndPoints.getProductsByName,
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        jsonDecode(response.data),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataModel> getProductsByCategory({
    required String productCategory,
  }) async {
    final response = await httpClient.get(
      endpoint: EndPoints.getProductsByCategory,
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        jsonDecode(response.data),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataModel> getProductsByIds({
    required List<int> productIds,
  }) async {
    final response = await httpClient.post(
      endpoint: EndPoints.getProductsByIds,
      body: productIds,
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        jsonDecode(response.data),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataModel> getProductsByOrder({
    required String order,
    required String direction,
  }) async {
    final response = await httpClient.get(
      endpoint: '${EndPoints.getProductsByOrder}/$order/sorted-by/$direction',
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        jsonDecode(response.data),
      );
    } else {
      throw ServerException();
    }
  }
}
