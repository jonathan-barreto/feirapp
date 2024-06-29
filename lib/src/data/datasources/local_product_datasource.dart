abstract class LocalProductDatasource {
  Future<List<String>> getFavoriteProducts();

  Future<bool> saveProductToFavorites({
    required String productId,
  });

  Future<bool> getIfProductIsFavorite({
    required String productId,
  });

  Future<bool> removeProductToFavorites({
    required String productId,
  });
}
