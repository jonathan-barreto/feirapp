import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetProductByIdUsecase implements Usecase<ProductEntity, String> {
  final ProductRepository repository;

  GetProductByIdUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductEntity>> call(String id) async {
    return await repository.getProductById(id: id);
  }
}
