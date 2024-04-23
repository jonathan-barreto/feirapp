import 'package:equatable/equatable.dart';
import 'package:sabor_natural_app/src/domain/entities/page_link_entity.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';

class ProductDataEntity extends Equatable {
  final List<ProductEntity> products;
  final PageLinkEntity links;

  const ProductDataEntity({
    required this.products,
    required this.links,
  });

  @override
  List<Object?> get props {
    return [
      products,
      links,
    ];
  }
}
