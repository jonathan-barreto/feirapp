import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductFilterParamEntity extends Equatable {
  String? name;
  String? category;
  double? minPrice;
  double? maxPrice;
  String? order;

  ProductFilterParamEntity({
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
