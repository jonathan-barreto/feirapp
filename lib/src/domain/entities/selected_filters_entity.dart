import 'package:feirapp/src/domain/entities/category_entity.dart';
import 'package:feirapp/src/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';

class SelectedFiltersEntity {
  final List<CategoryEntity> categories;
  final List<OrderEntity> orders;
  final RangeValues currentRangeValues;

  SelectedFiltersEntity({
    required this.categories,
    required this.orders,
    required this.currentRangeValues,
  });
}
