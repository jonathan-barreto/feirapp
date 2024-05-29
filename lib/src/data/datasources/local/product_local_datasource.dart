abstract class ProductLocalDatasource {
  List<String>? getAllFavoriteProducts({required String key});

  Future<bool?> setProductToFavorite({
    required String key,
    required List<String> products,
  });

  Future<void> removeKey({required String key});
}
