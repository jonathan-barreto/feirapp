import 'package:feirapp/src/core/shared/enums/filter_order_enum.dart';

class OrderTileEntity {
  final String title;
  final FilterOrderEnum order;
  bool isSelected;

  OrderTileEntity({
    required this.title,
    required this.order,
    this.isSelected = false,
  });
}
