import 'dart:convert';

import 'package:feirapp/src/domain/entities/credential_entity.dart';

class CredentialModel extends CredentialEntity {
  CredentialModel({
    required super.accessToken,
    required super.tokenType,
  });

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    return CredentialModel(
      accessToken: json['acess_token'],
      tokenType: json['token_type'],
    );
  }

  factory CredentialModel.fromEntity(CredentialEntity entity) {
    return CredentialModel(
      accessToken: entity.accessToken,
      tokenType: entity.tokenType,
    );
  }

  CredentialEntity toEntity() {
    return CredentialEntity(
      accessToken: accessToken,
      tokenType: tokenType,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    data['acess_token'] = accessToken;
    data['token_type'] = tokenType;

    return data;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
