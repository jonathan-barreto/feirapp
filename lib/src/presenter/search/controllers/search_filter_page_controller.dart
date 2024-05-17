import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/domain/entities/category_tile_entity.dart';

class SearchFilterPageController extends ChangeNotifier {
  List<CategoryTileEntity> categories = [];
  RangeValues currentRangeValues = const RangeValues(0, 100);

  void init({
    required List<CategoryTileEntity> categorieList,
    double? start,
    double? end,
  }) {
    categories = categorieList;

    if (start != null && end != null) {
      currentRangeValues = RangeValues(start, end);
    }
  }

  CategoryTileEntity radioChange({required int index}) {
    for (int index = 0; index < categories.length; index++) {
      categories[index].isSelected = false;
    }

    categories[index].isSelected = true;

    notifyListeners();

    return categories[index];
  }

  void rangeSliderChange({required RangeValues values}) {
    currentRangeValues = values;
    notifyListeners();
  }
}
