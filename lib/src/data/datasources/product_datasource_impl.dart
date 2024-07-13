import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_messages.dart';
import 'package:feirapp/src/data/datasources/product_datasource.dart';
import 'package:feirapp/src/data/model/product_data_model.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final HttpClient httpClient;

  ProductDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<ProductDataEntity> getAllProducts({
    required SearchProductFilterParam filter,
  }) async {
    // try {
    //   final HttpResponse response = await httpClient.post(
    //     endpoint: AppEndpoints.getAllProducts,
    //     body: filter.toJson(),
    //   );

    //   final productDataModel = ProductDataModel.fromMap(
    //     response.data,
    //   );

    //   final ProductDataEntity productDataEntity = productDataModel.toEntity();

    //   return productDataEntity;
    // } catch (e) {
    //   throw ServerException();
    // }
    throw ServerException();
  }

  @override
  Future<ProductDataEntity> getMoreProductsByLink({
    required String link,
    required SearchProductFilterParam? params,
  }) async {
    // try {
    //   final HttpResponse response = await httpClient.post(
    //     endpoint: link,
    //     body: params,
    //   );

    //   final productDataModel = ProductDataModel.fromMap(
    //     response.data,
    //   );

    //   final ProductDataEntity productDataEntity = productDataModel.toEntity();

    //   return productDataEntity;
    // } catch (e) {
    //   throw ServerException();
    // }
    throw ServerException();
  }

  @override
  Future<List<ProductEntity>> getProductsWithDiscount() async {
    try {
      final HttpResponse response = await httpClient.get(
        endpoint: AppEndpoints.getProductsWithDiscount,
      );

      final ProductDataModel productDataModel = ProductDataModel.fromMap(
        response.data,
      );

      if (productDataModel.data != null) {
        return productDataModel.data!.map((e) => e.toEntity()).toList();
      }

      throw ServerException(
        message: productDataModel.message,
      );
    } catch (e) {
      throw ServerException(
        message: e is ServerException ? e.message : AppMessages.serverError,
      );
    }
  }

  @override
  Future<List<ProductEntity>> getProductById({required String id}) async {
    // try {
    //   final HttpResponse response = await httpClient.get(
    //     endpoint: '${AppEndpoints.getProductById}/$id',
    //   );

    //   final productDataModel = ProductDataModel.fromMap(
    //     response.data,
    //   );

    //   final ProductDataEntity productDataEntity = productDataModel.toEntity();

    //   return productDataEntity;
    // } catch (e) {
    //   throw ServerException();
    // }
    throw ServerException();
  }

  @override
  Future<List<ProductEntity>> getProductsByIds({
    required GetProductsByIdsParam productIds,
  }) async {
    // try {
    //   final HttpResponse response = await httpClient.post(
    //     endpoint: AppEndpoints.getProductsByIds,
    //     body: productIds.toJson(),
    //   );

    //   final productDataModel = ProductDataModel.fromMap(
    //     response.data,
    //   );

    //   final ProductDataEntity productDataEntity = productDataModel.toEntity();

    //   return productDataEntity;
    // } catch (e) {
    //   throw ServerException(message: 'Aconteceu um erro!');
    // }
    throw ServerException();
  }
}
