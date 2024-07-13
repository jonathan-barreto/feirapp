import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/entities/logout_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

abstract class AuthDatasource {
  Future<UserEntity> getUserProfile();

  Future<CredentialEntity> loginUser({
    required LoginParam param,
  });

  Future<LogoutEntity> logoutUser();
}
