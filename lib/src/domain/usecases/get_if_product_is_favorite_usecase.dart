import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class GetIfProductIsFavoriteUsecase implements Usecase<bool, String> {
  final LocalProductRepository repository;

  GetIfProductIsFavoriteUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(String params) async {
    try {
      return await repository.getIfProductIsFavorite(
        productId: params,
      );
    } on StorageException {
      return Left(
        StorageFailure(),
      );
    }
  }
}
