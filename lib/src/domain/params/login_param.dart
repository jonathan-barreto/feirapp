class LoginParam {
  final String email;
  final String password;

  LoginParam({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
