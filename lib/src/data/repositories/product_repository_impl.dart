import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/product_datasource.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> getAllProducts({
    required SearchProductFilterParam params,
  }) async {
    try {
      final result = await datasource.getAllProducts(
        filter: params,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDataEntity>> getProductById({
    required String id,
  }) async {
    try {
      final result = await datasource.getProductById(
        id: id,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDataEntity>> getProductsByIds({
    required List<int> productIds,
  }) async {
    try {
      final result = await datasource.getProductsByIds(
        productIds: productIds,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDataEntity>> getDiscountedProducts() async {
    try {
      final ProductDataEntity result = await datasource.getDiscountedProducts();

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDataEntity>> getMoreProductsByLink({
    required String link,
    required SearchProductFilterParam? params,
  }) async {
    try {
      final ProductDataEntity result = await datasource.getMoreProductsByLink(
        link: link,
        params: params,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
