import 'dart:convert';

import 'package:feirapp/src/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.acessToken,
    required super.tokenType,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      acessToken: json['acess_token'],
      tokenType: json['token_type'],
    );
  }

  factory LoginModel.fromEntity(LoginEntity entity) {
    return LoginModel(
      acessToken: entity.acessToken,
      tokenType: entity.tokenType,
    );
  }

  LoginEntity toEntity() {
    return LoginEntity(
      acessToken: acessToken,
      tokenType: tokenType,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    data['acess_token'] = acessToken;
    data['token_type'] = tokenType;

    return data;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
