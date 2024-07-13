import 'package:feirapp/src/data/model/user_model.dart';

class UserDataModel {
  final UserModel? data;
  final String? message;

  UserDataModel({
    required this.data,
    required this.message,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      data: map['data'] != null ? UserModel.fromMap(map['data']) : null,
      message: map['message'],
    );
  }
}
