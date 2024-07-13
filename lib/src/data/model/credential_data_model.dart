import 'package:feirapp/src/data/model/credential_model.dart';

class CredentialDataModel {
  final CredentialModel? data;
  final String? message;

  CredentialDataModel({
    required this.data,
    required this.message,
  });

  factory CredentialDataModel.fromMap(Map<String, dynamic> map) {
    return CredentialDataModel(
      data: map['data'] != null ? CredentialModel.fromMap(map['data']) : null,
      message: map['message'],
    );
  }
}
