import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/data/datasources/local/product_local_datasource.dart';

class ProductLocalDatasourceImpl implements ProductLocalDatasource {
  final LocalStorage storage;

  ProductLocalDatasourceImpl({
    required this.storage,
  });

  @override
  List<String>? getAllFavoriteProducts({required String key}) {
    return storage.getStringList(key: key);
  }

  @override
  Future<bool?> setProductToFavorite({
    required String key,
    required List<String> products,
  }) async {
    return await storage.setStringList(key: key, values: products);
  }

  @override
  Future<void> removeKey({required String key}) async {
    return await storage.clearKey(key: key);
  }
}
