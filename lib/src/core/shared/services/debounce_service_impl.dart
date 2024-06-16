import 'dart:async';

import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:flutter/services.dart';

class DebounceServiceImpl implements DebounceService {
  Timer? timer;

  DebounceServiceImpl();

  @override
  void call(VoidCallback run) {
    timer?.cancel();

    timer = Timer(const Duration(seconds: 1), run);
  }
}
