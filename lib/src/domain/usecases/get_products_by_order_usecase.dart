import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/core/usecase/usecase.dart';
import 'package:sabor_natural_app/src/domain/entities/parameters/order_specification_param.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';

class GetAllProductsByOrderUsecase
    implements Usecase<ProductDataEntity, OrderSpecificationParam> {
  final ProductRepository repository;

  GetAllProductsByOrderUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> call(
    OrderSpecificationParam params,
  ) {
    return repository.getProductsByOrder(
      order: params.order,
      direction: params.direction,
    );
  }
}
