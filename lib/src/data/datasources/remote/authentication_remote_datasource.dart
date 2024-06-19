import 'package:feirapp/src/data/model/login_data_model.dart';
import 'package:feirapp/src/data/model/user_model.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

abstract class AuthenticationRemoteDatasource {
  Future<LoginDataModel> login({required LoginParam param});
  Future<UserModel> getUser();
}
