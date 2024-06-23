import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/repositories/credential_repository.dart';

class RemoveUserCredentialUsecase implements Usecase<void, NoParams> {
  final CredentialRepository repository;

  RemoveUserCredentialUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.removeUserCredential();
  }
}
