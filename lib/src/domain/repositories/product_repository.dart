import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/product_filter_param_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductDataEntity>> getAllProducts({
    required ProductFilterParamEntity params,
  });

  Future<Either<Failure, ProductDataEntity>> getProductById({
    required String id,
  });

  Future<Either<Failure, ProductDataEntity>> getProductsByIds({
    required List<int> productIds,
  });

  Future<Either<Failure, ProductDataEntity>> getDiscountedProducts();

  Future<Either<Failure, ProductDataEntity>> getMoreProductsByLink({
    required String link,
    required ProductFilterParamEntity? params,
  });

  Either<Failure, List<String>?> getAllFavoriteProducts({required String key});

  Future<Either<Failure, bool?>> setProductToFavorite({
    required String key,
    required List<String> products,
  });

  Either<Failure, void> removeKey({required String key});
}
