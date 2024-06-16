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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['acess_token'] = acessToken;
    data['token_type'] = tokenType;

    return data;
  }
}
