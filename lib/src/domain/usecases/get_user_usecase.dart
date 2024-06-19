import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/repositories/authentication_repository.dart';

class GetUserUsecase implements Usecase<UserEntity, NoParams> {
  final AuthenticationRepository repository;

  GetUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getUser();
  }
}
