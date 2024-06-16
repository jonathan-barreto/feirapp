import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:feirapp/src/domain/entities/login_data_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';
import 'package:feirapp/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource remoteDatasource;

  AuthenticationRepositoryImpl({
    required this.remoteDatasource,
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
}
