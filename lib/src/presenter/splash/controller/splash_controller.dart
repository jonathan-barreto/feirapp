import 'dart:convert';

import 'package:feirapp/src/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends ChangeNotifier {
  Future<LoginEntity?> getCredentias() async {
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
