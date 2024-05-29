abstract class LocalStorage {
  bool? getBool({
    required String key,
  });

  int? getInt({
    required String key,
  });

  double? getDouble({
    required String key,
  });

  String? getString({
    required String key,
  });

  List<String>? getStringList({
    required String key,
  });

  Future<bool?> setBool({
    required String key,
    required bool value,
  });

  Future<bool?> setInt({
    required String key,
    required int value,
  });

  Future<bool?> setDouble({
    required String key,
    required double value,
  });

  Future<bool?> setString({
    required String key,
    required String value,
  });

  Future<bool?> setStringList({
    required String key,
    required List<String> values,
  });

  Future<void> clearKey({
    required String key,
  });
}





