import 'dart:convert';

import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/data/datasources/local/authentication_local_datasource.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';

class AuthenticationLocalDatasourceImpl
    implements AuthenticationLocalDatasource {
  final LocalStorage storage;

  AuthenticationLocalDatasourceImpl({
    required this.storage,
  });

  @override
  Future<bool?> saveUserCredentials({required LoginEntity param}) {
    final String json = jsonEncode(
      param.toJson(),
    );

    return storage.setString(key: 'credentials', value: json);
  }
}
