import 'package:feirapp/src/domain/usecases/save_user_credentials_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:feirapp/src/domain/entities/login_data_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';
import 'package:feirapp/src/domain/usecases/login_usecase.dart';

class LoginController extends ChangeNotifier {
  final LoginUsecase loginUsecase;
  final SaveUserCredentialsUsecase saveUserCredentialsUsecase;

  LoginController({
    required this.loginUsecase,
    required this.saveUserCredentialsUsecase,
  });

  String? email = kDebugMode ? 'jonathan777barreto@gmail.com' : null;
  String? password = kDebugMode ? '92665401' : null;

  bool loading = false;

  bool hasError = false;
  LoginDataEntity? loginDataEntity;

  void _setLoading() {
    loading = !loading;
    notifyListeners();
  }

  Future<void> login() async {
    _setLoading();

    if (kDebugMode || email != null && password != null) {
      final LoginParam loginParam = LoginParam(
        email: email!,
        password: password!,
      );

      final result = await loginUsecase.call(loginParam);
      result.fold((l) => hasError = true, (r) => loginDataEntity = r);
    }

    _setLoading();

    saveUserCredentials();
  }

  Future<void> saveUserCredentials() async {
    if (loginDataEntity?.data != null) {
      final result = await saveUserCredentialsUsecase.call(
        loginDataEntity!.data,
      );
    }
  }
}
