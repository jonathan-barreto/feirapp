import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';

abstract class LocalProductRepository {
  Future<Either<Failure, List<String>>> getFavoriteProducts();

  Future<Either<Failure, bool>> saveProductToFavorites({
    required String productId,
  });

  Future<Either<Failure, bool>> getIfProductIsFavorite({
    required String productId,
  });

  Future<Either<Failure, bool>> removeProductToFavorites({
    required String productId,
  });
}
