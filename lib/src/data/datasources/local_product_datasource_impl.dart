import 'dart:convert';

import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/shared/constants/app_storage_keys.dart';
import 'package:feirapp/src/data/datasources/local_product_datasource.dart';
import 'package:feirapp/src/data/model/product_model.dart';
import 'package:feirapp/src/domain/entities/category_entity.dart';
import 'package:feirapp/src/domain/entities/order_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';

class LocalProductDatasourceImpl implements LocalProductDatasource {
  final LocalStorage storage;

  LocalProductDatasourceImpl({
    required this.storage,
  });

  @override
  Future<List<String>> getFavoriteProducts() async {
    try {
      final List<String> products = await storage.getStringList(
        key: AppStorageKeys.favotireProducts,
      );

      final List<String> productsIds = products.map((e) {
        final ProductModel productModel = ProductModel.fromMap(
          jsonDecode(e),
        );

        return '${productModel.id}';
      }).toList();

      return productsIds;
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<List<String>> getFavoriteProductsByFilters({
    required SelectedFiltersEntity filters,
  }) async {
    final double startValue = filters.currentRangeValues.start;
    final double endValue = filters.currentRangeValues.end;

    final CategoryEntity categorie = filters.categories.firstWhere((element) {
      return element.isSelected;
    });

    final OrderEntity order = filters.orders.firstWhere((element) {
      return element.isSelected;
    });

    final List<String> products = await storage.getStringList(
      key: AppStorageKeys.favotireProducts,
    );

    List<String> filteredProducts = [];

    for (int index = 0; index < products.length; index++) {
      final String savedJsonProduct = products[index];

      final ProductModel product = ProductModel.fromMap(
        jsonDecode(
          savedJsonProduct,
        ),
      );

      final String productPrice = (product.discountPrice ?? product.price);
      final double price = double.parse(productPrice);

      if (price >= startValue && price <= endValue) {
        if (categorie.category.isNotEmpty) {
          if (product.category == categorie.category) {
            filteredProducts.add(
              savedJsonProduct,
            );
          }
        } else {
          filteredProducts.add(
            savedJsonProduct,
          );
        }
      }
    }

    switch (order.order) {
      case '':
        break;
      case 'asc':
        filteredProducts.sort((a, b) {
          final ProductModel productA = ProductModel.fromMap(
            jsonDecode(
              a,
            ),
          );

          final ProductModel productB = ProductModel.fromMap(
            jsonDecode(
              b,
            ),
          );

          final double priceA = double.parse(
            productA.discountPrice ?? productB.price,
          );

          final double priceB = double.parse(
            productA.discountPrice ?? productB.price,
          );

          return priceA.compareTo(priceB);
        });
        break;
      case 'desc':
        filteredProducts.sort((a, b) {
          final ProductModel productA = ProductModel.fromMap(
            jsonDecode(
              a,
            ),
          );

          final ProductModel productB = ProductModel.fromMap(
            jsonDecode(
              b,
            ),
          );

          final double priceA = double.parse(
            productA.discountPrice ?? productB.price,
          );

          final double priceB = double.parse(
            productA.discountPrice ?? productB.price,
          );

          return priceB.compareTo(priceA);
        });
        break;
    }

    List<String> productsIds = [];

    for (int index = 0; index < filteredProducts.length; index++) {
      final ProductModel productModel = ProductModel.fromMap(
        jsonDecode(
          filteredProducts[index],
        ),
      );

      productsIds.add('${productModel.id}');
    }

    return productsIds;
  }

  @override
  Future<bool> saveProductToFavorites({required ProductEntity product}) async {
    try {
      final List<String> favotireProducts = await storage.getStringList(
        key: AppStorageKeys.favotireProducts,
      );

      final ProductModel productModel = ProductModel.fromEntity(
        product,
      );

      final String productJson = productModel.toJson();

      if (favotireProducts.isEmpty) {
        favotireProducts.add(productJson);
      } else {
        bool containsId = false;

        for (int index = 0; index < favotireProducts.length; index++) {
          final String savedJsonProduct = favotireProducts[index];

          final ProductModel savedModelProduct = ProductModel.fromMap(
            jsonDecode(
              savedJsonProduct,
            ),
          );

          if (productModel.id == savedModelProduct.id) {
            containsId = true;
            break;
          }
        }

        if (containsId == false) {
          favotireProducts.add(productJson);
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
