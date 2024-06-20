import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';
import 'package:feirapp/src/domain/repositories/authentication_repository.dart';

class GetUserCredentialsUsecase implements Usecase<LoginEntity, NoParams> {
  final AuthenticationRepository repository;

  GetUserCredentialsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, LoginEntity>> call(NoParams params) async {
    return await repository.getUserCredentials();
  }
}
