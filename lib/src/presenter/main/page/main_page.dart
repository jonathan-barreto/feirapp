import 'package:feirapp/src/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/main/controller/main_controller.dart';
import 'package:feirapp/src/presenter/main/widgets/standard_icon_image_widget.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MainPage extends StatefulWidget {
  final UserEntity user;

  const MainPage({
    super.key,
    required this.user,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController controller = getIt<MainController>();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: controller.widgets[controller.indexSelected],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 1,
            items: controller.iconsAssets.asMap().entries.map((e) {
              return BottomNavigationBarItem(
                label: '',
                icon: StandardIconImageWidget(
                  imagePath: e.value,
                  iconIndex: e.key,
                  indexSelected: controller.indexSelected,
                ),
              );
            }).toList(),
            currentIndex: controller.indexSelected,
            onTap: (value) => controller.selectedIndex(value),
          ),
        );
      },
    );
  }
}
