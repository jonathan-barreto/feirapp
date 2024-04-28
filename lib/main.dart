import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/init/init.dart' as di;
import 'package:sabor_natural_app/src/presenter/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}
