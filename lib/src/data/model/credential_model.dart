import 'dart:convert';

import 'package:feirapp/src/domain/entities/credential_entity.dart';



class CredentialModel extends CredentialEntity {
  CredentialModel({
    required super.acessToken,
    required super.tokenType,
  });

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    return CredentialModel(
      acessToken: json['acess_token'],
      tokenType: json['token_type'],
    );
  }

  factory CredentialModel.fromEntity(CredentialEntity entity) {
    return CredentialModel(
      acessToken: entity.acessToken,
      tokenType: entity.tokenType,
    );
  }

  CredentialEntity toEntity() {
    return CredentialEntity(
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
