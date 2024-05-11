import 'package:equatable/equatable.dart';

class ProductFilterParamEntity extends Equatable {
  final String? name;
  final String? category;
  final double? minPrice;
  final double? maxPrice;
  final String? order;

  const ProductFilterParamEntity({
    this.name,
    this.category,
    this.minPrice,
    this.maxPrice,
    this.order,
  });

  @override
  List<Object?> get props {
    return [
      name,
      category,
      minPrice,
      maxPrice,
      order,
    ];
  }
}
