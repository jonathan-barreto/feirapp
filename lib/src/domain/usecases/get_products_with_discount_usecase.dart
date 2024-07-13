import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetProductsWithDiscountUsecase
    implements Usecase<List<ProductEntity>, NoParams> {
  final ProductRepository repository;

  GetProductsWithDiscountUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await repository.getProductsWithDiscount();
  }
}
