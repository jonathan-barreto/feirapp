import 'dart:convert';

import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/shared/constants/app_storage_keys.dart';
import 'package:feirapp/src/data/datasources/credential_datasource.dart';
import 'package:feirapp/src/data/model/credential_model.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';

class CredentialDatasourceImpl implements CredentialDatasource {
  final LocalStorage storage;

  CredentialDatasourceImpl({
    required this.storage,
  });

  @override
  Future<CredentialEntity> getUserCredential() async {
    try {
      final String json = await storage.getString(
        key: AppStorageKeys.credential,
      );

      final CredentialModel credentialModel = CredentialModel.fromJson(
        jsonDecode(
          json,
        ),
      );

      return credentialModel.toEntity();
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<bool> saveUserCredential({required CredentialEntity param}) async {
    try {
      final CredentialModel credentialModel = CredentialModel.fromEntity(
        param,
      );

      final String json = credentialModel.toJson();

      final bool credentialsSaves = await storage.setString(
        key: AppStorageKeys.credential,
        value: json,
      );

      return credentialsSaves;
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<void> removeUserCredential() {
    try {
      return storage.clearKey(
        key: AppStorageKeys.credential,
      );
    } catch (e) {
      throw StorageException();
    }
  }
}
