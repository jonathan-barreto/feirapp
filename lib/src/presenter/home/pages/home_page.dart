import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/banner_ad_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/card_product_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/home/controllers/home_controller.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/app_bar_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight) / 2;
    final double itemWidth = size.width / 2;

    return SafeArea(
      child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Column(
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
                    child: CustomScrollView(
                      slivers: [
                        SliverList.list(
                          children: const [
                            AppBarHomeWidget(),
                            BannerAdWidget(),
                          ],
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(
                            StyleValues.small,
                          ),
                          sliver: SliverGrid.builder(
                            itemCount: controller.products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: StyleValues.small,
                              crossAxisSpacing: StyleValues.small,
                              childAspectRatio: (itemWidth / itemHeight),
                            ),
                            itemBuilder: (context, index) {
                              final product = controller.products[index];

                              return CardProductWidget(
                                product: product,
                                addProductFunction: () async {
                                  // await store.addProductInCart(
                                  //   product: product,
                                  // );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
