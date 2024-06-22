import 'package:feirapp/src/data/model/credential_data_model.dart';
import 'package:feirapp/src/data/model/user_model.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

abstract class AuthenticationRemoteDatasource {
  Future<CredentialDataModel> login({required LoginParam param});
  Future<UserModel> getUser();
}
