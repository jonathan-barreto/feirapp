import 'dart:convert';

import 'package:feirapp/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.whatsapp,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      whatsapp: map['whatsapp'],
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      whatsapp: entity.whatsapp,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['whatsapp'] = whatsapp;

    return map;
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      whatsapp: whatsapp,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
