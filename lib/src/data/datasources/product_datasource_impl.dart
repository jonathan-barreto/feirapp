import 'dart:convert';

import 'package:sabor_natural_app/src/core/errors/exceptions.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client.dart';
import 'package:sabor_natural_app/src/core/shared/constants/endpoints.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
import 'package:sabor_natural_app/src/data/model/product_filter_param_model.dart';
import 'package:sabor_natural_app/src/domain/entities/product_filter_param_entity.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final HttpClient httpClient;

  ProductDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<ProductDataModel> getAllProducts({
    required ProductFilterParamModel filter,
  }) async {
    final String json = jsonEncode(
      filter.toJson(),
    );

    final response = await httpClient.post(
      endpoint: EndPoints.getAllProducts,
      body: json,
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        response.data,
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
        response.data,
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
        response.data,
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
        response.data,
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
        response.data,
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataModel> getDiscountedProducts() async {
    final HttpResponse response = await httpClient.get(
      endpoint: EndPoints.getDiscountedProducts,
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataModel> getMoreProductsByLinkUsecase({
    required String link,
    required ProductFilterParamEntity? params,
  }) async {
    final HttpResponse response = await httpClient.post(
      endpoint: link,
      body: params,
    );

    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException();
    }
  }
}
