import 'package:feirapp/src/di/di.dart' as di;
import 'package:feirapp/src/presenter/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}
