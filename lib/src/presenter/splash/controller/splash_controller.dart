import 'dart:convert';

import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/domain/usecases/get_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends ChangeNotifier {
  final GetUserUsecase getUserUsecase;

  SplashController({
    required this.getUserUsecase,
  });

  Future<UserEntity?> getUser() async {
    UserEntity? user;
    final LoginEntity? credentals = await _getCredentias();

    if (credentals != null) {
      final result = await getUserUsecase(NoParams());
      result.fold((l) => null, (r) => user = r);
    }

    return user;
  }

  Future<LoginEntity?> _getCredentias() async {
    final prefs = await SharedPreferences.getInstance();
    final String? credentalsJson = prefs.getString('credentials');

    if (credentalsJson != null) {
      final LoginEntity credentals = LoginEntity.fromJson(
        jsonDecode(credentalsJson),
      );

      return credentals;
    }

    return null;
  }
}
