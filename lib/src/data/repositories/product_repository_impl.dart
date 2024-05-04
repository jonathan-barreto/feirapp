import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/exceptions.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> getAllProducts() async {
    try {
      final ProductDataModel result = await datasource.getAllProducts();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDataEntity>> getProductsByName({
    required String productName,
  }) async {
    try {
      final ProductDataModel result = await datasource.getProductsByName(
        productName: productName,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDataEntity>> getProductsByCategory({
    required String productCategory,
  }) async {
    try {
      final ProductDataModel result = await datasource.getProductsByCategory(
        productCategory: productCategory,
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
      final ProductDataModel result = await datasource.getProductsByIds(
        productIds: productIds,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDataEntity>> getProductsByOrder({
    required String order,
    required String direction,
  }) async {
    try {
      final ProductDataModel result = await datasource.getProductsByOrder(
        order: order,
        direction: direction,
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
  Future<Either<Failure, ProductDataEntity>> getMoreProductsByLinkUsecase({
    required String link,
  }) async {
    try {
      final ProductDataEntity result =
          await datasource.getMoreProductsByLinkUsecase(
        link: link,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
