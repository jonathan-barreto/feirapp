import 'dart:convert';

import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_messages.dart';
import 'package:feirapp/src/data/datasources/auth_datasource.dart';
import 'package:feirapp/src/data/model/credential_data_model.dart';
import 'package:feirapp/src/data/model/logout_model.dart';
import 'package:feirapp/src/data/model/user_data_model.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';
import 'package:feirapp/src/domain/entities/logout_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final HttpClient httpClient;

  AuthDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<UserEntity> getUserProfile() async {
    try {
      final HttpResponse response = await httpClient.get(
        endpoint: AppEndpoints.profile,
      );

      final UserDataModel userDataModel = UserDataModel.fromMap(
        response.data,
      );

      if (userDataModel.data != null) {
        return userDataModel.data!.toEntity();
      }

      throw ServerException(
        message: userDataModel.message,
      );
    } catch (e) {
      throw ServerException(
        message: AppMessages.serverError,
      );
    }
  }

  @override
  Future<CredentialEntity> loginUser({required LoginParam param}) async {
    try {
      final String json = jsonEncode(
        param.toJson(),
      );

      final HttpResponse response = await httpClient.post(
        endpoint: AppEndpoints.login,
        body: json,
      );

      final CredentialDataModel credentialData = CredentialDataModel.fromMap(
        response.data,
      );

      if (credentialData.data != null) {
        return credentialData.data!.toEntity();
      }

      throw ServerException(
        message: credentialData.message,
      );
    } catch (e) {
      throw ServerException(
        message: e is ServerException ? e.message : AppMessages.serverError,
      );
    }
  }

  @override
  Future<LogoutEntity> logoutUser() async {
    try {
      final HttpResponse response = await httpClient.get(
        endpoint: AppEndpoints.logout,
      );

      final LogoutModel logoutModel = LogoutModel.fromMap(
        response.data,
      );

      return logoutModel.toEntity();
    } catch (e) {
      throw ServerException(
        message: AppMessages.serverError,
      );
    }
  }
}
