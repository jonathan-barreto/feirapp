import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetAllProductsUsecase
    implements Usecase<ProductDataEntity, SearchProductFilterParam> {
  final ProductRepository repository;

  GetAllProductsUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductDataEntity>> call(
    SearchProductFilterParam params,
  ) async {
    return await repository.getAllProducts(params: params);
  }
}
