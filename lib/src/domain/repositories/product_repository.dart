import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/products_and_pagination_entity.dart';

import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';
import 'package:feirapp/src/domain/params/product_filter_param.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductsAndPaginationEntity>> getProducts({
    required ProductsFilterParam params,
  });

  Future<Either<Failure, ProductsAndPaginationEntity>> getMoreProductsByLink({
    required String url,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductById({
    required String id,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductsByIds({
    required GetProductsByIdsParam productIds,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductsWithDiscount();
}
