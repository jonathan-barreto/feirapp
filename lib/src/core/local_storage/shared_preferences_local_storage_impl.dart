import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage implements LocalStorage {
  final SharedPreferences prefs;

  SharedPreferencesLocalStorage({
    required this.prefs,
  });

  @override
  bool? getBool({required String key}) {
    return prefs.getBool(key);
  }

  @override
  double? getDouble({required String key}) {
    return prefs.getDouble(key);
  }

  @override
  int? getInt({required String key}) {
    return prefs.getInt(key);
  }

  @override
  String? getString({required String key}) {
    return prefs.getString(key);
  }

  @override
  List<String>? getStringList({required String key}) {
    return prefs.getStringList(key);
  }

  @override
  Future<bool?> setBool({required String key, required bool value}) async {
    return await prefs.setBool(key, value);
  }

  @override
  Future<bool?> setInt({required String key, required int value}) async {
    return prefs.setInt(key, value);
  }

  @override
  Future<bool?> setDouble({required String key, required double value}) async {
    return await prefs.setDouble(key, value);
  }

  @override
  Future<bool?> setString({required String key, required String value}) async {
    return await prefs.setString(key, value);
  }

  @override
  Future<bool?> setStringList({
    required String key,
    required List<String> values,
  }) async {
    return await prefs.setStringList(key, values);
  }

  @override
  Future<bool> clearKey({required String key}) async {
    return await prefs.remove(key);
  }
}
