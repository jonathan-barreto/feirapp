import 'dart:convert';

import 'package:feirapp/src/data/model/login_model.dart';
import 'package:feirapp/src/domain/entities/login_data_entity.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';

class LoginDataModel extends LoginDataEntity {
  final LoginModel loginModel;

  LoginDataModel({
    required this.loginModel,
    super.message,
  }) : super(data: loginModel);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      loginModel: LoginModel.fromJson(json['data']),
      message: json['message'],
    );
  }

  factory LoginDataModel.fromEntity(LoginDataEntity entity) {
    return LoginDataModel(
      loginModel: LoginModel.fromEntity(
        entity.data,
      ),
    );
  }

  LoginDataEntity toEntity() {
    return LoginDataEntity(
      data: LoginEntity(
        acessToken: loginModel.acessToken,
        tokenType: loginModel.tokenType,
      ),
      message: message,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = loginModel.toMap();
    map['message'] = message;

    return map;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
