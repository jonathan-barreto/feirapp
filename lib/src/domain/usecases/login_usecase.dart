import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';
import 'package:feirapp/src/domain/repositories/auth_repository.dart';

class LoginUsecase implements Usecase<CredentialEntity, LoginParam> {
  final AuthRepository repository;

  LoginUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, CredentialEntity>> call(LoginParam params) async {
    return await repository.login(param: params);
  }
}
