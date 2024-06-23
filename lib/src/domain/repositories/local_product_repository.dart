import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';

abstract class LocalProductRepository {
  Future<Either<Failure, List<String>>> getSavedProductsInFavorites();

  Future<Either<Failure, bool>> saveProductToFavorites({
    required List<String> products,
  });
}
