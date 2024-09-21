import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';

abstract class LocalProductDatasource {
  Future<List<String>> getFavoriteProducts();

  Future<List<String>> getFavoriteProductsByFilters({
    required SelectedFiltersEntity filters,
  });

  Future<bool> saveProductToFavorites({
    required ProductEntity product,
  });

  Future<bool> getIfProductIsFavorite({
    required String productId,
  });

  Future<bool> removeProductToFavorites({
    required String productId,
  });

  Future<List<ProductEntity>> getProductsFromCart();

  Future<bool> saveProductToCart({
    required ProductEntity product,
  });

  Future<bool> updateProductQuantity({
    required ProductEntity product,
  });

  Future<bool> removeProductToCart({
    required ProductEntity product,
  });
}
