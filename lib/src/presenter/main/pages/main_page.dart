import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/main/controllers/main_controller.dart';

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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                ),
                label: 'Início',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.bagShopping,
                ),
                label: 'Carrinho',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  LineAwesomeIcons.user,
                  size: 35,
                ),
                label: 'Minha Conta',
              ),
            ],
            currentIndex: controller.indexSelected,
            onTap: (value) => controller.selectedIndex(value),
          ),
        );
      },
    );
  }
}
