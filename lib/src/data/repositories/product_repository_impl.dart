import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/product_datasource.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/products_and_pagination_entity.dart';

import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';
import 'package:feirapp/src/domain/params/product_filter_param.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, ProductsAndPaginationEntity>> getProducts({
    required ProductsFilterParam params,
  }) async {
    try {
      final result = await datasource.getProducts(
        param: params,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductsAndPaginationEntity>> getMoreProductsByLink({
    required String url,
  }) async {
    try {
      final result = await datasource.getMoreProductsByLink(
        url: url,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductById({
    required String id,
  }) async {
    try {
      final result = await datasource.getProductById(
        id: id,
      );

      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByIds({
    required GetProductsByIdsParam productIds,
  }) async {
    try {
      final result = await datasource.getProductsByIds(
        productIds: productIds,
      );

      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsWithDiscount() async {
    try {
      final result = await datasource.getProductsWithDiscount();

      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }
}
