import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/repositories/credential_repository.dart';

class GetUserCredentialUsecase implements Usecase<CredentialEntity, NoParams> {
  final CredentialRepository repository;

  GetUserCredentialUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, CredentialEntity>> call(NoParams params) async {
    return await repository.getUserCredential();
  }
}
