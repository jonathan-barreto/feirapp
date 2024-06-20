import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/local/authentication_local_datasource.dart';
import 'package:feirapp/src/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:feirapp/src/data/model/user_model.dart';
import 'package:feirapp/src/domain/entities/login_data_entity.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';
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
  Future<Either<Failure, LoginDataEntity>> login({
    required LoginParam param,
  }) async {
    try {
      final LoginDataEntity result = await remoteDatasource.login(
        param: param,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserCredentials({
    required LoginEntity param,
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
  Future<Either<Failure, LoginEntity>> getUserCredentials() async {
    try {
      final loginModel = await localDatasource.getUserCredentials();
      final LoginEntity loginEntity = loginModel.toEntity();

      return Right(loginEntity);
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
