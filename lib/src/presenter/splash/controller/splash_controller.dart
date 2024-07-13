import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/usecases/get_user_credentials_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_user_usecase.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final GetUserUsecase getUserUsecase;
  final GetUserCredentialUsecase getUserCredentialsUsecase;

  SplashController({
    required this.getUserUsecase,
    required this.getUserCredentialsUsecase,
  });

  UserEntity? user;
  final CurrentUserEntity currentUser = getIt<CurrentUserEntity>();

  Future<bool> getUser() async {
    final CredentialEntity? credential = await _getUserCredentias();

    if (credential != null) {
      final result = await getUserUsecase(
        NoParams(),
      );

      result.fold((l) => null, (r) => user = r);
    }

    if (user != null) {
      currentUser.data = user;
    }

    return user != null;
  }

  Future<CredentialEntity?> _getUserCredentias() async {
    final result = await getUserCredentialsUsecase(
      NoParams(),
    );

    CredentialEntity? credential;
    result.fold((l) => null, (r) => credential = r);

    return credential;
  }
}
