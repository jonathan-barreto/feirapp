import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/params/set_product_to_favorite_param.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class SetProductToFavoriteUsecase
    implements Usecase<bool?, SetProductToFavoriteParam> {
  final LocalProductRepository repository;

  SetProductToFavoriteUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool?>> call(SetProductToFavoriteParam params) async {
    return await repository.saveProductToFavorites(
      products: params.products,
    );
  }
}
