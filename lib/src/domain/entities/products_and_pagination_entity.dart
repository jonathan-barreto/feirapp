import 'package:feirapp/src/domain/entities/product_entity.dart';

class ProductsAndPaginationEntity {
  final List<ProductEntity> products;
  final String? nextPageUrl;

  ProductsAndPaginationEntity({
    required this.products,
    required this.nextPageUrl,
  });
}
