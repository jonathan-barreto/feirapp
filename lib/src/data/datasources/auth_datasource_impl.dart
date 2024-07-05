import 'dart:convert';

import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/data/datasources/auth_datasource.dart';
import 'package:feirapp/src/data/model/credential_data_model.dart';
import 'package:feirapp/src/data/model/logout_model.dart';
import 'package:feirapp/src/data/model/user_model.dart';
import 'package:feirapp/src/domain/entities/credential_data_entity.dart';
import 'package:feirapp/src/domain/entities/logout_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final HttpClient httpClient;

  AuthDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<UserEntity> getUser() async {
    try {
      final HttpResponse response = await httpClient.get(
        endpoint: AppEndpoints.getUser,
      );

      final UserModel userModel = UserModel.fromMap(
        response.data['data'],
      );

      return userModel.toEntity();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CredentialDataEntity> login({required LoginParam param}) async {
    try {
      final String json = jsonEncode(
        param.toJson(),
      );

      final HttpResponse response = await httpClient.post(
        endpoint: AppEndpoints.login,
        body: json,
      );

      final CredentialDataModel credentialDataModel =
          CredentialDataModel.fromMap(
        response.data,
      );

      return credentialDataModel.toEntity();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LogoutEntity> logout() async {
    try {
      final HttpResponse response = await httpClient.get(
        endpoint: AppEndpoints.logout,
      );

      final LogoutModel logoutModel = LogoutModel.fromMap(
        response.data,
      );

      return logoutModel.toEntity();
    } catch (e) {
      throw ServerException();
    }
  }
}
