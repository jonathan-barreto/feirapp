import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/theme/theme_data_custom.dart';
import 'package:sabor_natural_app/src/presenter/main/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: themeDataCustom,
      routes: {
        '/': (context) => const MainPage(),
      },
    );
  }
}
