import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/entities/login_data_entity.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginDataEntity>> login({
    required LoginParam param,
  });

  Future<Either<Failure, bool?>> saveUserCredentials({
    required LoginEntity param,
  });

  Future<Either<Failure, UserEntity>> getUser();
}
