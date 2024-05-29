class ProductFilterParamEntity{
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

  clear() {
    name = null;
    category = null;
    minPrice = null;
    maxPrice = null;
    order = null;
  }
}
