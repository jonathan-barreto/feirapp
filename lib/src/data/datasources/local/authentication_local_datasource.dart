import 'package:feirapp/src/data/model/credential_model.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';

abstract class AuthenticationLocalDatasource {
  Future<bool> saveUserCredentials({required CredentialEntity param});
  Future<CredentialModel> getUserCredentials();
}
