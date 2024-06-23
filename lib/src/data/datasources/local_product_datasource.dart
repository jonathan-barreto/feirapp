abstract class LocalProductDatasource {
  Future<List<String>> getSavedProductsInFavorites();

  Future<bool> saveProductToFavorites({
    required List<String> products,
  });
}
