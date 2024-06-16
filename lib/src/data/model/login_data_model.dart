import 'package:feirapp/src/data/model/login_model.dart';
import 'package:feirapp/src/domain/entities/login_data_entity.dart';

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};

    map['data'] = loginModel.toJson();
    map['message'] = message;

    return map;
  }
}
