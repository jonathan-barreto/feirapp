import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sabor_natural_app/src/core/shared/services/debounce_service.dart';

class DebounceServiceImpl implements DebounceService {
  Timer? timer;

  DebounceServiceImpl();

  @override
  void call(VoidCallback run) {
    timer?.cancel();

    timer = Timer(const Duration(seconds: 1), run);
  }
}
