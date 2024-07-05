import 'dart:convert';

import 'package:feirapp/src/domain/entities/credential_entity.dart';

class CredentialModel extends CredentialEntity {
  CredentialModel({
    required super.accessToken,
    required super.tokenType,
  });

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    return CredentialModel(
      accessToken: map['acess_token'],
      tokenType: map['token_type'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['acess_token'] = accessToken;
    map['token_type'] = tokenType;

    return map;
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

  String toJson() {
    return jsonEncode(toMap());
  }
}
