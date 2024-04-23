import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductDataEntity>> getAllProducts();

  Future<Either<Failure, ProductDataEntity>> getProductsByName({
    required String productName,
  });

  Future<Either<Failure, ProductDataEntity>> getProductsByCategory({
    required String productCategory,
  });

  Future<Either<Failure, ProductDataEntity>> getProductsByOrder({
    required String order,
    required String direction,
  });

  Future<Either<Failure, ProductDataEntity>> getProductsByIds({
    required List<int> productIds,
  });
}
