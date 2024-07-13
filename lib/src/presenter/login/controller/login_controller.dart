import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';
import 'package:feirapp/src/domain/usecases/login_usecase.dart';
import 'package:feirapp/src/domain/usecases/save_user_credentials_usecase.dart';
import 'package:flutter/foundation.dart';

class LoginController extends ChangeNotifier {
  final LoginUsecase loginUsecase;
  final SaveUserCredentialUsecase saveUserCredentialsUsecase;

  LoginController({
    required this.loginUsecase,
    required this.saveUserCredentialsUsecase,
  });

  String? email = kDebugMode ? 'jonathan777barreto@gmail.com' : null;
  String? password = kDebugMode ? '42526272' : null;

  bool loading = false;

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<String?> login() async {
    showLoading();

    String? errorMessage;
    CredentialEntity? credential;

    if (email != null && password != null) {
      final LoginParam loginParam = LoginParam(
        email: email!,
        password: password!,
      );

      final result = await loginUsecase.call(
        loginParam,
      );

      result.fold((l) {
        if (l is ServerFailure) {
          errorMessage = l.message;
        }
      }, (r) => credential = r);
    }

    if (credential != null) {
      await saveUserCredential(
        credential: credential!,
      );
    }

    hideLoading();

    return errorMessage;
  }

  Future<String?> saveUserCredential({
    required CredentialEntity credential,
  }) async {
    final result = await saveUserCredentialsUsecase.call(
      credential,
    );

    String? errorMessage;

    result.fold((l) {
      if (l is ServerFailure) {
        errorMessage = l.message;
      }
    }, (r) => null);

    return errorMessage;
  }
}
