import 'dart:convert';

import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:feirapp/src/data/model/credential_data_model.dart';
import 'package:feirapp/src/data/model/user_model.dart';
import 'package:feirapp/src/domain/params/login_param.dart';

class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  final HttpClient httpClient;

  AuthenticationRemoteDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<CredentialDataModel> login({required LoginParam param}) async {
    final String json = jsonEncode(
      param.toJson(),
    );

    final HttpResponse response = await httpClient.post(
      endpoint: '/user/login',
      body: json,
    );

    if (response.statusCode == 200) {
      return CredentialDataModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser() async {
    final HttpResponse response = await httpClient.get(
      endpoint: '/user/profile',
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(
        response.data['data'],
      );
    } else {
      throw ServerException();
    }
  }
}
