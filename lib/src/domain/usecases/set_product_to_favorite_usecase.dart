import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/params/set_product_to_favorite_param.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class SetProductToFavoriteUsecase
    implements Usecase<bool?, SetProductToFavoriteParam> {
  final ProductRepository repository;

  SetProductToFavoriteUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool?>> call(SetProductToFavoriteParam params) async {
    return await repository.setProductToFavorite(
      key: params.key,
      products: params.products,
    );
  }
}
