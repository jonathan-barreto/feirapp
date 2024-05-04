import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/presenter/home/page/home_page.dart';
import 'package:sabor_natural_app/src/presenter/main/state/main_state.dart';
import 'package:sabor_natural_app/src/presenter/search/page/search_page.dart';

class MainStore extends ValueNotifier<RawState> {
  MainStore() : super(const IdleState());

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

  void init() {
    value = SuccessState<MainState>(
      output: MainState.initial(index: 0),
    );
  }

  void selectIndex({required int index}) {
    value = SuccessState<MainState>(
      output: MainState.selectIndex(index: index),
    );
  }
}
