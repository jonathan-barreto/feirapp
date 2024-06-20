import 'package:feirapp/src/data/model/login_model.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';

abstract class AuthenticationLocalDatasource {
  Future<bool> saveUserCredentials({required LoginEntity param});
  Future<LoginModel> getUserCredentials(); 
}
