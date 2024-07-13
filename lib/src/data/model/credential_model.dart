import 'dart:convert';

import 'package:feirapp/src/domain/entities/credential_entity.dart';

class CredentialModel {
  final String? accessToken;
  final String? tokenType;

  CredentialModel({
    required this.accessToken,
    required this.tokenType,
  });

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    return CredentialModel(
      accessToken: map['access_token'],
      tokenType: map['token_type'],
    );
  }

  factory CredentialModel.fromEntity(CredentialEntity entity) {
    return CredentialModel(
      accessToken: entity.accessToken,
      tokenType: entity.tokenType,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['access_token'] = accessToken;
    map['token_type'] = tokenType;

    return map;
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
