import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class RemoveKeyUsecase extends Usecase<void, String> {
  final ProductRepository repository;

  RemoveKeyUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(String params) async {
    return repository.removeKey(key: params);
  }
}
