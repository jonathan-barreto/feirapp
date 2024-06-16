import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/params/get_product_param_entity.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetMoreProductsByLinkUsecase
    implements Usecase<ProductDataEntity, GetProductParamEntity> {
  final ProductRepository repository;

  GetMoreProductsByLinkUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> call(
    GetProductParamEntity params,
  ) async {
    return await repository.getMoreProductsByLink(
        link: params.endpoint ?? '', params: params.productFilterParamEntity);
  }
}
