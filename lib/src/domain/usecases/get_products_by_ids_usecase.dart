import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/get_products_by_ids_param.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetProductsByIdsUsecase
    implements Usecase<ProductDataEntity, GetProductsByIdsParam> {
  final ProductRepository repository;

  GetProductsByIdsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> call(
    GetProductsByIdsParam params,
  ) async {
    return await repository.getProductsByIds(productIds: params);
  }
}
