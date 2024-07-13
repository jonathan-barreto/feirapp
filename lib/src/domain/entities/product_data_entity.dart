import 'package:feirapp/src/domain/entities/product_entity.dart';

class ProductDataEntity {
  final List<ProductEntity> products;
  final String? message;

  ProductDataEntity({
    required this.products,
    required this.message,
  });
}
