import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/entities/credential_data_entity.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, CredentialDataEntity>> login({
    required LoginParam param,
  });

  Future<Either<Failure, bool>> saveUserCredentials({
    required CredentialEntity param,
  });

  Future<Either<Failure, CredentialEntity>> getUserCredentials();

  Future<Either<Failure, UserEntity>> getUser();
}
