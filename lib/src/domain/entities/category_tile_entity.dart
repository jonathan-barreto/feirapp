class CategoryTileEntity {
  final String title;
  final String category;
  bool isSelected;

  CategoryTileEntity({
    required this.title,
    required this.category,
    this.isSelected = false,
  });
}
