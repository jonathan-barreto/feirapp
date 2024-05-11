import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/data/model/product_filter_param_model.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductDataEntity>> getAllProducts({
    required ProductFilterParamModel filter,
  });

  Future<Either<Failure, ProductDataEntity>> getProductsByIds({
    required List<int> productIds,
  });

  Future<Either<Failure, ProductDataEntity>> getDiscountedProducts();

  Future<Either<Failure, ProductDataEntity>> getMoreProductsByLinkUsecase({
    required String link,
  });
}
