import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/main/controllers/main_controller.dart';
import 'package:sabor_natural_app/src/presenter/main/widgets/standard_icon_image_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController controller = getIt<MainController>();

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
