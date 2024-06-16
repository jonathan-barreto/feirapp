import 'package:feirapp/src/domain/entities/login_entity.dart';

class LoginDataEntity {
  final LoginEntity data;
  final String? message;

  LoginDataEntity({
    required this.data,
    this.message,
  });
}
