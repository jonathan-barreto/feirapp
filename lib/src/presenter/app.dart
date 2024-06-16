import 'package:feirapp/src/presenter/splash/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/theme/theme_data_custom.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppTheme.getTheme,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
