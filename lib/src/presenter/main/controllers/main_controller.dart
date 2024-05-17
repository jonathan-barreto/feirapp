import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/presenter/home/pages/home_page.dart';
import 'package:sabor_natural_app/src/presenter/search/pages/search_page.dart';

class MainController extends ChangeNotifier {
  int indexSelected = 0;

  final List<Widget> widgets = [
    const HomePage(),
    const SearchPage(),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.blueAccent,
    ),
  ];

  void selectedIndex(int index) {
    indexSelected = index;
    notifyListeners();
  }
}
