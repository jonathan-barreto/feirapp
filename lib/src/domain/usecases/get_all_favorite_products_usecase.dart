import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/core/usecase/usecase.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';

class GetAllFavoriteProductUsecase implements Usecase<List<String>?, String> {
  final ProductRepository repository;

  GetAllFavoriteProductUsecase({
    required this.repository,
  });
  
  @override
  Future<Either<Failure, List<String>?>> call(String params) async {
   return repository.getAllFavoriteProducts(key: params);
  }
}
