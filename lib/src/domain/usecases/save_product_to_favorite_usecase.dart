import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class SaveProductToFavoriteUsecase implements Usecase<bool, String> {
  final LocalProductRepository repository;

  SaveProductToFavoriteUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await repository.saveProductToFavorites(
      productId: params,
    );
  }
}
