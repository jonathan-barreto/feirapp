import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/logout_entity.dart';
import 'package:feirapp/src/domain/repositories/auth_repository.dart';

class LogoutUsecase implements Usecase<LogoutEntity, NoParams> {
  final AuthRepository repository;

  LogoutUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, LogoutEntity>> call(NoParams params) async {
    return await repository.logout();
  }
}
