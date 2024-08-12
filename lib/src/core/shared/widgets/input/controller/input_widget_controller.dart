import 'package:flutter/material.dart';

class InputWidgetController extends ChangeNotifier {
  late final TextEditingController textController;

  bool showClear = false;

  Future<void> initController({required String? initText}) async {
    textController = TextEditingController(
      text: initText,
    );
  }

  void changeShowClear({required String value}) {
    showClear = value.isNotEmpty;
    notifyListeners();
  }
}
