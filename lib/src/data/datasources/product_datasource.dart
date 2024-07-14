import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/products_and_pagination_entity.dart';
import 'package:feirapp/src/domain/params/get_product_param.dart';
import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';

abstract class ProductDatasource {
  Future<ProductsAndPaginationEntity> getProducts({
    required GetProductsParam param,
  });

  // Future<ProductsAndPaginationEntity> getMoreProductsByLink({
  //   required String link,
  //   required ProductsFilterParam? params,
  // });

  Future<List<ProductEntity>> getProductsWithDiscount();

  Future<List<ProductEntity>> getProductById({
    required String id,
  });

  Future<List<ProductEntity>> getProductsByIds({
    required GetProductsByIdsParam productIds,
  });
}
