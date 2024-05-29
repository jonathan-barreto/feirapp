import 'dart:convert';

import 'package:sabor_natural_app/src/core/errors/exceptions.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client.dart';
import 'package:sabor_natural_app/src/core/shared/constants/endpoints.dart';
import 'package:sabor_natural_app/src/data/datasources/remote/product_remote_datasource.dart';
import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
import 'package:sabor_natural_app/src/data/model/product_filter_param_model.dart';
import 'package:sabor_natural_app/src/domain/params/product_filter_param_entity.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final HttpClient httpClient;

  ProductRemoteDatasourceImpl({
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
  Future<ProductDataModel> getProductById({required String id}) async {
    final response = await httpClient.get(
      endpoint: '${EndPoints.getProductById}/$id',
 
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
  Future<ProductDataModel> getMoreProductsByLink({
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
