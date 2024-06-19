import 'package:feirapp/src/domain/entities/category_tile_entity.dart';
import 'package:feirapp/src/domain/entities/order_tile_entity.dart';
import 'package:flutter/material.dart';

class FilterStore extends ChangeNotifier {
  final List<CategoryTileEntity> categories = [
    CategoryTileEntity(
      title: 'Todos',
      category: '',
      isSelected: true,
    ),
    CategoryTileEntity(
      title: 'Frutas',
      category: 'fruta',
    ),
    CategoryTileEntity(
      title: 'Verduras',
      category: 'verdura',
    ),
    CategoryTileEntity(
      title: 'Vegetais',
      category: 'vegetal',
    ),
    CategoryTileEntity(
      title: 'Temperos',
      category: 'tempero',
    ),
  ];

  final List<OrderTileEntity> orders = [
    OrderTileEntity(
      title: 'Padrão',
      order: '',
      isSelected: true,
    ),
    OrderTileEntity(
      title: 'Crescente',
      order: 'asc',
    ),
    OrderTileEntity(
      title: 'Decrescente',
      order: 'desc',
    ),
  ];

  RangeValues currentRangeValues = const RangeValues(0, 100);

  void setCategoryIsSelected({required int index}) {
    for (int i = 0; i < categories.length; i++) {
      categories[i].isSelected = false;
    }

    categories[index].isSelected = true;
    notifyListeners();
  }

  void setOrderIsSelected({required int index}) {
    for (int i = 0; i < orders.length; i++) {
      orders[i].isSelected = false;
    }

    orders[index].isSelected = true;
    notifyListeners();
  }

  void rangeValuesNnChanged({required RangeValues values}) {
    currentRangeValues = values;
    notifyListeners();
  }

  String getStartRangeValue() {
    return currentRangeValues.start.toStringAsFixed(2);
  }

  String getEndRangeValue() {
    return currentRangeValues.end.toStringAsFixed(2);
  }

  void clearFilter() {
    for (int i = 0; i < categories.length; i++) {
      categories[i].isSelected = false;
    }

    categories.first.isSelected = true;

    for (int i = 0; i < orders.length; i++) {
      orders[i].isSelected = false;
    }

    orders.first.isSelected = true;

    currentRangeValues = const RangeValues(0, 100);

    notifyListeners();
  }
}
