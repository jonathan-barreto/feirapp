import 'dart:convert';

import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/shared/constants/storage_keys.dart';
import 'package:feirapp/src/data/datasources/local/authentication_local_datasource.dart';
import 'package:feirapp/src/data/model/credential_model.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';

class AuthenticationLocalDatasourceImpl
    implements AuthenticationLocalDatasource {
  final LocalStorage storage;

  AuthenticationLocalDatasourceImpl({
    required this.storage,
  });

  @override
  Future<bool> saveUserCredentials({required CredentialEntity param}) async {
    final CredentialModel credentialsModel = CredentialModel.fromEntity(
      param,
    );

    final String json = credentialsModel.toJson();

    final bool? credentialsSaves = await storage.setString(
      key: StorageKeys.credentials,
      value: json,
    );

    return credentialsSaves ?? false;
  }

  @override
  Future<CredentialModel> getUserCredentials() async {
    final String json = storage.getString(key: StorageKeys.credentials) ?? '';

    final CredentialModel credentialsModel = CredentialModel.fromJson(
      jsonDecode(
        json,
      ),
    );

    return credentialsModel;
  }
}
