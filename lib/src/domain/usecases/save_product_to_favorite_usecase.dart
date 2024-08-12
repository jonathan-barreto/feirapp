import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class SaveProductToFavoriteUsecase implements Usecase<bool, ProductEntity> {
  final LocalProductRepository repository;

  SaveProductToFavoriteUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(ProductEntity params) async {
    return await repository.saveProductToFavorites(
      product: params,
    );
  }
}
