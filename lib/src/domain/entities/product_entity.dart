import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String category;
  final String unit;
  final String price;
  final String image;
  final String? weight;
  final int? discount;
  final String? discountPrice;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.unit,
    required this.price,
    required this.image,
    this.weight,
    this.discount,
    this.discountPrice,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      unit,
      price,
      image,
      weight,
      discount,
      discountPrice,
    ];
  }
}
