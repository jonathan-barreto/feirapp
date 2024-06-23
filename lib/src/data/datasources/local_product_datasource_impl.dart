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
  Future<List<String>> getSavedProductsInFavorites() async {
    try {
      return await storage.getStringList(
        key: AppStorageKeys.favotireProducts,
      );
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<bool> saveProductToFavorites({required List<String> products}) async {
    try {
      return await storage.setStringList(
        key: AppStorageKeys.favotireProducts,
        values: products,
      );
    } catch (e) {
      throw StorageException();
    }
  }
}
