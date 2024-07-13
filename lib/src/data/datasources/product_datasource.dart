import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';

abstract class ProductDatasource {
  Future<ProductDataEntity> getAllProducts({
    required SearchProductFilterParam filter,
  });

  Future<ProductDataEntity> getMoreProductsByLink({
    required String link,
    required SearchProductFilterParam? params,
  });

  Future<List<ProductEntity>> getProductsWithDiscount();

  Future<List<ProductEntity>> getProductById({
    required String id,
  });

  Future<List<ProductEntity>> getProductsByIds({
    required GetProductsByIdsParam productIds,
  });
}
