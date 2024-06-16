import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/product_filter_param_entity.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetAllProductsUsecase
    implements Usecase<ProductDataEntity, ProductFilterParamEntity> {
  final ProductRepository repository;

  GetAllProductsUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductDataEntity>> call(
    ProductFilterParamEntity params,
  ) async {
    return await repository.getAllProducts(params: params);
  }
}
