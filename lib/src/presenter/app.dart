import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/theme/theme_data_custom.dart';
import 'package:feirapp/src/presenter/init/page/init_page.dart';
import 'package:feirapp/src/presenter/login/page/login_page.dart';
import 'package:feirapp/src/presenter/main/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppTheme.getTheme,
      routes: {
        '/': (context) => const LoginPage(),
      },
    );
  }
}
