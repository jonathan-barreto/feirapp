import 'package:feirapp/src/domain/entities/category_tile_entity.dart';
import 'package:feirapp/src/domain/entities/order_tile_entity.dart';
import 'package:flutter/material.dart';

class SelectedFiltersEntity {
  final List<CategoryTileEntity> categories;
  final List<OrderTileEntity> orders;
  final RangeValues currentRangeValues;

  SelectedFiltersEntity({
    required this.categories,
    required this.orders,
    required this.currentRangeValues,
  });
}
