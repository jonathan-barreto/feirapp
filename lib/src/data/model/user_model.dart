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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      numberContact: map['number_contact'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
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

  String toJson() {
    return jsonEncode(toMap());
  }
}
