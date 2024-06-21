import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/shared/constants/endpoints.dart';
import 'package:feirapp/src/data/datasources/remote/product_remote_datasource.dart';
import 'package:feirapp/src/data/model/product_data_model.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final HttpClient httpClient;

  ProductRemoteDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<ProductDataEntity> getAllProducts({
    required SearchProductFilterParam filter,
  }) async {
    try {
      final HttpResponse response = await httpClient.post(
        endpoint: EndPoints.getAllProducts,
        body: filter.toJson(),
      );

      final productDataModel = ProductDataModel.fromJson(
        response.data,
      );

      final ProductDataEntity productDataEntity = productDataModel.toEntity();

      return productDataEntity;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataEntity> getProductById({required String id}) async {
    try {
      final HttpResponse response = await httpClient.get(
        endpoint: '${EndPoints.getProductById}/$id',
      );

      final productDataModel = ProductDataModel.fromJson(
        response.data,
      );

      final ProductDataEntity productDataEntity = productDataModel.toEntity();

      return productDataEntity;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataEntity> getProductsByIds({
    required List<int> productIds,
  }) async {
    try {
      final HttpResponse response = await httpClient.post(
        endpoint: EndPoints.getProductsByIds,
        body: productIds,
      );
      final productDataModel = ProductDataModel.fromJson(
        response.data,
      );

      final ProductDataEntity productDataEntity = productDataModel.toEntity();

      return productDataEntity;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataEntity> getDiscountedProducts() async {
    try {
      final HttpResponse response = await httpClient.get(
        endpoint: EndPoints.getDiscountedProducts,
      );

      final productDataModel = ProductDataModel.fromJson(
        response.data,
      );

      final ProductDataEntity productDataEntity = productDataModel.toEntity();

      return productDataEntity;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductDataEntity> getMoreProductsByLink({
    required String link,
    required SearchProductFilterParam? params,
  }) async {
    try {
      final HttpResponse response = await httpClient.post(
        endpoint: link,
        body: params,
      );

      final productDataModel = ProductDataModel.fromJson(
        response.data,
      );

      final ProductDataEntity productDataEntity = productDataModel.toEntity();

      return productDataEntity;
    } catch (e) {
      throw ServerException();
    }
  }
}
