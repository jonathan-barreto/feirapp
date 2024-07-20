class CategoryEntity {
  final String title;
  final String category;
  bool isSelected;

  CategoryEntity({
    required this.title,
    required this.category,
    this.isSelected = false,
  });
}
