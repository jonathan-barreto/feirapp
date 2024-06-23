import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class GetAllFavoriteProductUsecase implements Usecase<List<String>?, NoParams> {
  final LocalProductRepository repository;

  GetAllFavoriteProductUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<String>?>> call(NoParams noParams) async {
    return repository.getSavedProductsInFavorites();
  }
}
