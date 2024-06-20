import 'dart:convert';

import 'package:feirapp/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String? createdAt;
  String? updatedAt;

  UserModel({
    required super.id,
    required super.name,
    required super.numberContact,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      numberContact: json['number_contact'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      numberContact: entity.numberContact,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      numberContact: numberContact,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['numberContact'] = numberContact;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
