import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/local/product_local_datasource.dart';
import 'package:feirapp/src/data/datasources/remote/product_remote_datasource.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;
  final ProductLocalDatasource localDatasource;

  ProductRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> getAllProducts({
    required SearchProductFilterParam params,
  }) async {
    try {
      final result = await remoteDatasource.getAllProducts(
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
      final result = await remoteDatasource.getProductById(
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
      final result = await remoteDatasource.getProductsByIds(
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
      final ProductDataEntity result =
          await remoteDatasource.getDiscountedProducts();

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
      final ProductDataEntity result =
          await remoteDatasource.getMoreProductsByLink(
        link: link,
        params: params,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, List<String>?> getAllFavoriteProducts({required String key}) {
    try {
      final result = localDatasource.getAllFavoriteProducts(key: key);
      return Right(result);
    } on SharedPreferencesFailure {
      return Left(SharedPreferencesFailure());
    }
  }

  @override
  Future<Either<Failure, bool?>> setProductToFavorite({
    required String key,
    required List<String> products,
  }) async {
    try {
      final bool? response = await localDatasource.setProductToFavorite(
        key: key,
        products: products,
      );

      return Right(response);
    } on SharedPreferencesFailure {
      return Left(SharedPreferencesFailure());
    }
  }

  @override
  Either<Failure, void> removeKey({required String key}) {
    try {
      localDatasource.removeKey(key: key);
      return const Right(null);
    } on SharedPreferencesFailure {
      return Left(SharedPreferencesFailure());
    }
  }
}
