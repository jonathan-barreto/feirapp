import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/login_data_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';
import 'package:feirapp/src/domain/repositories/authentication_repository.dart';

class LoginUsecase implements Usecase<LoginDataEntity, LoginParam> {
  final AuthenticationRepository repository;

  LoginUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, LoginDataEntity>> call(LoginParam params) async {
    return await repository.login(param: params);
  }
}
