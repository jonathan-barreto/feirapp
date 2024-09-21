import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';

abstract class LocalProductRepository {
  Future<Either<Failure, List<String>>> getFavoriteProducts();

  Future<Either<Failure, List<String>>> getFavoriteProductsByFilters({
    required SelectedFiltersEntity filters,
  });

  Future<Either<Failure, bool>> saveProductToFavorites({
    required ProductEntity product,
  });

  Future<Either<Failure, bool>> getIfProductIsFavorite({
    required String productId,
  });

  Future<Either<Failure, bool>> removeProductToFavorites({
    required String productId,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductsFromCart();

  Future<Either<Failure, bool>> saveProductToCart({
    required ProductEntity product,
  });

  Future<Either<Failure, bool>> updateProductQuantity({
    required ProductEntity product,
  });
}
