import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  UserEntity? user;
  bool loading = false;

  void _showLoading() {
    loading = true;
    notifyListeners();
  }

  void _hideLoading() {
    loading = false;
    notifyListeners();
  }

  Future<void> init() async {
    _showLoading();

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final CurrentUserEntity currentUserEntity = getIt<CurrentUserEntity>();
    user = currentUserEntity.data;

    _hideLoading();
  }
}
