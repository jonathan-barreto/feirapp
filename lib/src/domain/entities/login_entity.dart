class LoginEntity {
  final String acessToken;
  final String tokenType;

  LoginEntity({
    required this.acessToken,
    required this.tokenType,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    return LoginEntity(
      acessToken: json['acess_token'],
      tokenType: json['token_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['acess_token'] = acessToken;
    data['token_type'] = tokenType;

    return data;
  }
}
