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

  factory CredentialDataModel.fromJson(Map<String, dynamic> json) {
    return CredentialDataModel(
      credentialModel: CredentialModel.fromJson(json['data']),
      message: json['message'],
    );
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
        acessToken: credentialModel.acessToken,
        tokenType: credentialModel.tokenType,
      ),
      message: message,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = credentialModel.toMap();
    map['message'] = message;

    return map;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
