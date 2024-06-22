import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/usecases/get_user_credentials_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_user_usecase.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final GetUserUsecase getUserUsecase;
  final GetUserCredentialsUsecase getUserCredentialsUsecase;

  SplashController({
    required this.getUserUsecase,
    required this.getUserCredentialsUsecase,
  });

  UserEntity? user;
  final CurrentUserEntity currentUser = getIt<CurrentUserEntity>();

  Future<bool> getUser() async {
    final CredentialEntity? credentials = await _getCredentias();

    if (credentials != null) {
      final result = await getUserUsecase(NoParams());
      result.fold((l) => null, (r) => user = r);
    }

    if (user != null) {
      currentUser.data = user;
    }

    return currentUser.data != null;
  }

  Future<CredentialEntity?> _getCredentias() async {
    final Either<Failure, CredentialEntity> result = await getUserCredentialsUsecase(
      NoParams(),
    );

    CredentialEntity? loginEntity;

    result.fold((l) => null, (r) => loginEntity = r);

    return loginEntity;
  }
}
