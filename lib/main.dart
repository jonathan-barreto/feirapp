import 'package:feirapp/src/di/di.dart' as di;
import 'package:feirapp/src/presenter/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );

  await di.init();

  runApp(const MyApp());
}
