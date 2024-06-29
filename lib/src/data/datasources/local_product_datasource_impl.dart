import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/shared/constants/app_storage_keys.dart';
import 'package:feirapp/src/data/datasources/local_product_datasource.dart';

class LocalProductDatasourceImpl implements LocalProductDatasource {
  final LocalStorage storage;

  LocalProductDatasourceImpl({
    required this.storage,
  });

  @override
  Future<List<String>> getFavoriteProducts() async {
    try {
      return await storage.getStringList(
        key: AppStorageKeys.favotireProducts,
      );
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<bool> saveProductToFavorites({required String productId}) async {
    try {
      final List<String> favotireProducts = await getFavoriteProducts();

      if (favotireProducts.isEmpty) {
        favotireProducts.add(productId);
      } else {
        if (favotireProducts.contains(productId) == false) {
          favotireProducts.add(productId);
        }
      }

      return await storage.setStringList(
        key: AppStorageKeys.favotireProducts,
        values: favotireProducts,
      );
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<bool> getIfProductIsFavorite({required String productId}) async {
    try {
      final List<String> favotireProducts = await getFavoriteProducts();

      final bool productIsFavotire = favotireProducts.contains(
        productId,
      );

      return productIsFavotire;
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<bool> removeProductToFavorites({required String productId}) async {
    try {
      final List<String> favotireProducts = await getFavoriteProducts();

      final int productIndex = favotireProducts.indexWhere((element) {
        return element.contains(productId);
      });

      favotireProducts.removeAt(
        productIndex,
      );

      return await storage.setStringList(
        key: AppStorageKeys.favotireProducts,
        values: favotireProducts,
      );
    } catch (e) {
      throw StorageException();
    }
  }
}
