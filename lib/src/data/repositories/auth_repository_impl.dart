import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/auth_datasource.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
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
      final UserEntity userEntity = await datasource.getUserProfile();

      return Right(
        userEntity,
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CredentialEntity>> login({
    required LoginParam param,
  }) async {
    try {
      final CredentialEntity result = await datasource.loginUser(
        param: param,
      );

      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, LogoutEntity>> logout() async {
    try {
      final LogoutEntity logoutEntity = await datasource.logoutUser();

      return Right(
        logoutEntity,
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }
}
