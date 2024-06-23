import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/repositories/credential_repository.dart';

class SaveUserCredentialUsecase implements Usecase<bool?, CredentialEntity> {
  final CredentialRepository repository;

  SaveUserCredentialUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool?>> call(CredentialEntity params) async {
    return await repository.saveUserCredential(
      param: params,
    );
  }
}
