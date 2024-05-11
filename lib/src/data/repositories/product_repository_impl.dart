import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/exceptions.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
import 'package:sabor_natural_app/src/data/model/product_filter_param_model.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> getAllProducts({
    required ProductFilterParamModel filter,
  }) async {
    try {
      final ProductDataModel result = await datasource.getAllProducts(
        filter: filter,
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
