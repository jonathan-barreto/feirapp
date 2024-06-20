import 'dart:convert';

import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/shared/constants/storage_keys.dart';
import 'package:feirapp/src/data/datasources/local/authentication_local_datasource.dart';
import 'package:feirapp/src/data/model/login_model.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';

class AuthenticationLocalDatasourceImpl
    implements AuthenticationLocalDatasource {
  final LocalStorage storage;

  AuthenticationLocalDatasourceImpl({
    required this.storage,
  });

  @override
  Future<bool> saveUserCredentials({required LoginEntity param}) async {
    final LoginModel loginModel = LoginModel.fromEntity(
      param,
    );

    final String json = loginModel.toJson();

    final bool? credentialsSaves = await storage.setString(
      key: StorageKeys.credentials,
      value: json,
    );

    return credentialsSaves ?? false;
  }

  @override
  Future<LoginModel> getUserCredentials() async {
    final String json = storage.getString(key: StorageKeys.credentials) ?? '';

    final LoginModel loginModel = LoginModel.fromJson(
      jsonDecode(
        json,
      ),
    );

    return loginModel;
  }
}
