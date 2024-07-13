class ProductEntity {
  final int id;
  final String name;
  final String price;
  final String? discountPrice;
  final String category;
  final String unit;
  final String? weight;
  final String image;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    this.discountPrice,
    required this.category,
    required this.unit,
    this.weight,
    required this.image,
  });
}
