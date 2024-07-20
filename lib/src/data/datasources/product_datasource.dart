import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/products_and_pagination_entity.dart';
import 'package:feirapp/src/domain/params/get_product_param.dart';
import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';

abstract class ProductDatasource {
  Future<List<ProductEntity>> getProductsWithDiscount();

  Future<ProductsAndPaginationEntity> getProducts({
    required GetProductsParam param,
  });

  Future<ProductsAndPaginationEntity> getMoreProductsByLink({
    required String link,
  });

  Future<List<ProductEntity>> getProductById({
    required String id,
  });

  Future<List<ProductEntity>> getProductsByIds({
    required GetProductsByIdsParam productIds,
  });
}
