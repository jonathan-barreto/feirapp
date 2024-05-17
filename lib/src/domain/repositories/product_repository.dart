import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/entities/product_filter_param_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductDataEntity>> getAllProducts({
    required ProductFilterParamEntity params,
  });

  Future<Either<Failure, ProductDataEntity>> getProductsByIds({
    required List<int> productIds,
  });

  Future<Either<Failure, ProductDataEntity>> getDiscountedProducts();

  Future<Either<Failure, ProductDataEntity>> getMoreProductsByLinkUsecase({
    required String link,
    required ProductFilterParamEntity? params,
  });
}
