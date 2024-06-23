import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/auth_datasource.dart';
import 'package:feirapp/src/domain/entities/credential_data_entity.dart';
import 'package:feirapp/src/domain/entities/logout_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';
import 'package:feirapp/src/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final UserEntity userEntity = await datasource.getUser();

      return Right(userEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CredentialDataEntity>> login({
    required LoginParam param,
  }) async {
    try {
      final CredentialDataEntity result = await datasource.login(
        param: param,
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LogoutEntity>> logout() async {
    try {
      final LogoutEntity logoutEntity = await datasource.logout();

      return Right(logoutEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
