import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/credential_datasource.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/repositories/credential_repository.dart';

class CredentialRepositoryImpl implements CredentialRepository {
  final CredentialDatasource datasource;

  CredentialRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, CredentialEntity>> getUserCredential() async {
    try {
      final CredentialEntity result = await datasource.getUserCredential();

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserCredential({
    required CredentialEntity param,
  }) async {
    try {
      final bool result = await datasource.saveUserCredential(
        param: param,
      );

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeUserCredential() async {
    try {
      final void result = await datasource.removeUserCredential();

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }
}
