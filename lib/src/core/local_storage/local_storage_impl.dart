import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences prefs;

  LocalStorageImpl({
    required this.prefs,
  });

  @override
  Future<void> clearKey({required String key}) {
    return prefs.remove(key);
  }

  @override
  Future<String> getString({required String key}) async {
    return prefs.getString(key) ?? '';
  }

  @override
  Future<bool> setString({required String key, required String value}) async {
    return await prefs.setString(key, value);
  }

  @override
  Future<List<String>> getStringList({required String key}) async {
    return prefs.getStringList(key) ?? [];
  }

  @override
  Future<bool> setStringList({
    required String key,
    required List<String> values,
  }) async {
    return await prefs.setStringList(key, values);
  }
}
