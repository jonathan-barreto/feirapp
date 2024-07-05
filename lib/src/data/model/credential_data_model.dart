import 'dart:convert';

import 'package:feirapp/src/data/model/credential_model.dart';
import 'package:feirapp/src/domain/entities/credential_data_entity.dart';
import 'package:feirapp/src/domain/entities/credential_entity.dart';

class CredentialDataModel extends CredentialDataEntity {
  final CredentialModel credentialModel;

  CredentialDataModel({
    required this.credentialModel,
    super.message,
  }) : super(data: credentialModel);

  factory CredentialDataModel.fromMap(Map<String, dynamic> json) {
    return CredentialDataModel(
      credentialModel: CredentialModel.fromMap(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = credentialModel.toMap();
    map['message'] = message;

    return map;
  }

  factory CredentialDataModel.fromEntity(CredentialDataEntity entity) {
    return CredentialDataModel(
      credentialModel: CredentialModel.fromEntity(
        entity.data,
      ),
    );
  }

  CredentialDataEntity toEntity() {
    return CredentialDataEntity(
      data: CredentialEntity(
        accessToken: credentialModel.accessToken,
        tokenType: credentialModel.tokenType,
      ),
      message: message,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
