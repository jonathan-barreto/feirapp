import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_assets.dart';
import 'package:sabor_natural_app/src/presenter/home/pages/home_page.dart';
import 'package:sabor_natural_app/src/presenter/search/pages/search_page.dart';

class MainController extends ChangeNotifier {
  int indexSelected = 0;

  final List<Widget> widgets = [
    const HomePage(),
    Container(
      color: Colors.greenAccent,
    ),
    const SearchPage(),
    Container(
      color: Colors.blueAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
  ];

  final List<String> iconsAssets = [
    AppAssets.homeIcon,
    AppAssets.bookmarkIcon,
    AppAssets.searchIcon,
    AppAssets.bagIcon,
    AppAssets.userIcon,
  ];

  bool loading = true;

  void selectedIndex(int index) {
    indexSelected = index;
    notifyListeners();
  }

  Future<void> init() async {
    loading = true;
    notifyListeners();

    await Future.delayed(
      const Duration(seconds: 1),
    );

    loading = false;
    notifyListeners();
  }
}
