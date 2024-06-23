import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';

abstract class ProductDatasource {
  Future<ProductDataEntity> getAllProducts({
    required SearchProductFilterParam filter,
  });

  Future<ProductDataEntity> getProductById({
    required String id,
  });

  Future<ProductDataEntity> getProductsByIds({
    required List<int> productIds,
  });

  Future<ProductDataEntity> getMoreProductsByLink({
    required String link,
    required SearchProductFilterParam? params,
  });

  Future<ProductDataEntity> getDiscountedProducts();
}
