class OrderTileEntity {
  final String title;
  final String order;
  bool isSelected;

  OrderTileEntity({
    required this.title,
    required this.order,
    this.isSelected = false,
  });
}
