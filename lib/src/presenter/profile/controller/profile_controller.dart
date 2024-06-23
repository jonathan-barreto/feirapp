import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/domain/entities/logout_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/usecases/logout_usecase.dart';
import 'package:feirapp/src/domain/usecases/remove_user_credential_usecase.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  final LogoutUsecase logoutUsecase;
  final RemoveUserCredentialUsecase removeUserCredentialUsecase;

  ProfileController({
    required this.logoutUsecase,
    required this.removeUserCredentialUsecase,
  });

  UserEntity? user;

  bool loading = false;
  bool hasError = false;

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<void> init() async {
    showLoading();

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final CurrentUserEntity currentUserEntity = getIt<CurrentUserEntity>();
    user = currentUserEntity.data;

    hideLoading();
  }

  Future<bool> logout() async {
    showLoading();

    final Either<Failure, LogoutEntity> resut = await logoutUsecase(
      NoParams(),
    );

    resut.fold((l) => hasError = true, (r) => null);

    if (hasError == false) {
      await removeUserCredentialUsecase(NoParams());
    }

    return hasError;
  }
}
