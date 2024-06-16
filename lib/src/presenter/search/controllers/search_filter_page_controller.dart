import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/enums/filter_order_enum.dart';
import 'package:feirapp/src/domain/entities/category_tile_entity.dart';

class SearchFilterPageController extends ChangeNotifier {
  List<CategoryTileEntity> categories = [];
  RangeValues currentRangeValues = const RangeValues(0, 100);
  FilterOrderEnum? myOrder;

  void init({
    required List<CategoryTileEntity> categorieList,
    double? start,
    double? end,
    FilterOrderEnum? order,
  }) {
    categories = categorieList;

    myOrder = order;

    currentRangeValues = RangeValues(start ?? 0, end ?? 100);
  }

  CategoryTileEntity radioChange({required int index}) {
    for (int index = 0; index < categories.length; index++) {
      categories[index].isSelected = false;
    }

    categories[index].isSelected = true;

    notifyListeners();

    return categories[index];
  }

  void orderChange({required FilterOrderEnum value}) {
    myOrder = value;
    notifyListeners();
  }

  void rangeSliderChange({required RangeValues values}) {
    currentRangeValues = values;
    notifyListeners();
  }
}
