import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class GetProductsFromCartUsecase
    implements Usecase<List<ProductEntity>, NoParams> {
  final LocalProductRepository repository;

  GetProductsFromCartUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return repository.getProductsFromCart();
  }
}
