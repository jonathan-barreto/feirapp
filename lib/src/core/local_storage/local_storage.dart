abstract class LocalStorage {
  Future<void> clearKey({
    required String key,
  });

  Future<String> getString({
    required String key,
  });

  Future<bool> setString({
    required String key,
    required String value,
  });

  Future<List<String>> getStringList({
    required String key,
  });

  Future<bool> setStringList({
    required String key,
    required List<String> values,
  });
}
