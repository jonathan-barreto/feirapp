import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:feirapp/src/presenter/init/page/init_page.dart';
import 'package:feirapp/src/presenter/main/pages/main_page.dart';
import 'package:feirapp/src/presenter/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = getIt<SplashController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    final UserEntity? user = await controller.getUser();
    
    final CurrentUserEntity currentUser = getIt<CurrentUserEntity>();
    currentUser.data = user;

    if (mounted) {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(
              user: user,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const InitPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(),
          ),
        );
      },
    );
  }
}
