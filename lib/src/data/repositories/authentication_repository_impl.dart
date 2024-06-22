import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/local/authentication_local_datasource.dart';
import 'package:feirapp/src/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:feirapp/src/data/model/user_model.dart';
import 'package:feirapp/src/domain/entities/credential_data_entity.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';
import 'package:feirapp/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource remoteDatasource;
  final AuthenticationLocalDatasource localDatasource;

  AuthenticationRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, CredentialDataEntity>> login({
    required LoginParam param,
  }) async {
    try {
      final CredentialDataEntity result = await remoteDatasource.login(
        param: param,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserCredentials({
    required CredentialEntity param,
  }) async {
    try {
      final credentialsSaves = await localDatasource.saveUserCredentials(
        param: param,
      );

      return Right(credentialsSaves);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CredentialEntity>> getUserCredentials() async {
    try {
      final credentialModel = await localDatasource.getUserCredentials();
      final CredentialEntity credentialEntity = credentialModel.toEntity();

      return Right(credentialEntity);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final UserModel userModel = await remoteDatasource.getUser();
      final UserEntity userEntity = userModel.toEntity();

      return Right(userEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
