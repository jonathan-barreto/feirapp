import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/profile/controller/profile_controller.dart';
import 'package:feirapp/src/presenter/profile/widget/profile_page_content_widget.dart';
import 'package:feirapp/src/presenter/splash/page/splash_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController controller = getIt<ProfileController>();

  Future<void> logout() async {
    final bool hasError = await controller.logout();

    if (mounted) {
      if (hasError == false) {
        // controller.hideLoading();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashPage(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Visibility(
                visible: controller.loading == false,
                child: IconButton(
                  onPressed: logout,
                  icon: const Icon(
                    Icons.exit_to_app,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                Visibility(
                  visible: controller.loading == true,
                  child: const Expanded(
                    child: CircularProgressIndicatorCustom(),
                  ),
                ),
                Visibility(
                  visible: controller.loading == false,
                  child: Expanded(
                    child: ProfilePageContentWidget(
                      name: controller.user?.name ?? '',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
