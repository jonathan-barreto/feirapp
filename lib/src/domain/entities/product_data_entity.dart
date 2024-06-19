import 'package:equatable/equatable.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';

class ProductDataEntity extends Equatable {
  final List<ProductEntity> products;
  final String? link;

  const ProductDataEntity({
    required this.products,
    required this.link,
  });

  @override
  List<Object?> get props {
    return [
      products,
      link,
    ];
  }
}
