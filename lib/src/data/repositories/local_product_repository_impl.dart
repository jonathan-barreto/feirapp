import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/local_product_datasource.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class LocalProductRepositoryImpl implements LocalProductRepository {
  final LocalProductDatasource datasource;

  LocalProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<String>>> getSavedProductsInFavorites() async {
    try {
      final List<String> result =
          await datasource.getSavedProductsInFavorites();

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveProductToFavorites({
    required List<String> products,
  }) async {
    try {
      final bool result = await datasource.saveProductToFavorites(
        products: products,
      );

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }
}
