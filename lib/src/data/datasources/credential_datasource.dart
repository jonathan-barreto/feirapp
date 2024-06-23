import 'package:feirapp/src/domain/entities/credential_entity.dart';

abstract class CredentialDatasource {
  Future<CredentialEntity> getUserCredential();

  Future<bool> saveUserCredential({
    required CredentialEntity param,
  });

  Future<void> removeUserCredential();
}
