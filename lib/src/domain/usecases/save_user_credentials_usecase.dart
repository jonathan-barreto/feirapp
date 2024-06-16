import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';
import 'package:feirapp/src/domain/repositories/authentication_repository.dart';

class SaveUserCredentialsUsecase implements Usecase<bool?, LoginEntity> {
  final AuthenticationRepository repository;

  SaveUserCredentialsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool?>> call(LoginEntity params) async {
    return await repository.saveUserCredentials(
      param: params,
    );
  }
}
