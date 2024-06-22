import 'package:feirapp/src/domain/entities/credential_entity.dart';

class CredentialDataEntity {
  final CredentialEntity data;
  final String? message;

  CredentialDataEntity({
    required this.data,
    this.message,
  });
}
