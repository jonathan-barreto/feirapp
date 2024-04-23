import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/core/usecase/usecase.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';

class GetProductsByNameUsecase implements Usecase<ProductDataEntity, String> {
  final ProductRepository repository;

  GetProductsByNameUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> call(params) async {
    return await repository.getProductsByName(
      productName: params,
    );
  }
}
