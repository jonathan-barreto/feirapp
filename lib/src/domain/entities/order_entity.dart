class OrderEntity {
  final String title;
  final String order;
  bool isSelected;

  OrderEntity({
    required this.title,
    required this.order,
    this.isSelected = false,
  });
}
