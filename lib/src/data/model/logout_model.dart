import 'dart:convert';

import 'package:feirapp/src/domain/entities/logout_entity.dart';

class LogoutModel extends LogoutEntity {
  LogoutModel({
    required super.message,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
    
      message: json['message'],
    );
  }

  factory LogoutModel.fromEntity(LogoutEntity entity) {
    return LogoutModel(
      message: entity.message,
    );
  }

  LogoutEntity toEntity() {
    return LogoutEntity(
      message: message,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = data;
    map['message'] = message;

    return map;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
