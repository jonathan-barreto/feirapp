import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';

abstract class CredentialRepository {
  Future<Either<Failure, CredentialEntity>> getUserCredential();

  Future<Either<Failure, bool>> saveUserCredential({
    required CredentialEntity param,
  });

  Future<Either<Failure, void>> removeUserCredential();
}
