import 'package:feirapp/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String createdAt;
  final String updatedAt;

  UserModel({
    required super.id,
    required super.name,
    required super.numberContact,
    required this.createdAt,
    required this.updatedAt,
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['numberContact'] = numberContact;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }
}
