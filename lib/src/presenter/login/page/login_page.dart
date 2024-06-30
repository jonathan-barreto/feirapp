import 'package:feirapp/src/presenter/splash/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/login/controller/login_controller.dart';
import 'package:feirapp/src/presenter/login/widgets/login_page_content_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = getIt<LoginController>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> login() async {
    final bool hasLoginError = await controller.login();

    if (mounted) {
      if (hasLoginError == false) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashPage(),
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        controller.hideLoading();
      }
    }
  }

  Future<void> goToRegisterPage() async {}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    children: [
                      Visibility(
                        visible: !controller.loading,
                        child: Expanded(
                          child: LoginPageContentWidget(
                            isKeyboardVisible: isKeyboardVisible,
                            loginOnPressed: login,
                            emailOnChanged: (value) {
                              controller.email = value;
                            },
                            passwordOnChanged: (value) {
                              controller.password = value;
                            },
                            registerOnPressed: goToRegisterPage,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.loading,
                        child: const Expanded(
                          child: Center(
                            child: StandardLoadingWidget(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
