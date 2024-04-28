import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/main/state/main_state.dart';
import 'package:sabor_natural_app/src/presenter/main/store/main_store.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainStore store = getIt<MainStore>();

  @override
  void initState() {
    super.initState();

    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, value, child) {
        if (value is SuccessState<MainState>) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: store.widgets[value.output.indexSelected],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.transparent,
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
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.cartShopping,
                  ),
                  label: 'Carrinho',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                  ),
                  label: 'Minha Conta',
                ),
              ],
              currentIndex: value.output.indexSelected,
              onTap: (value) => store.selectIndex(index: value),
            ),
          );
        }

        return Container();
      },
    );
  }
}
