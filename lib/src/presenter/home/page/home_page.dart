import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/extensions/get_user_first_name_extension.dart';
import 'package:feirapp/src/core/shared/widgets/banner_ad_widget.dart';
import 'package:feirapp/src/core/shared/widgets/card_product_widget.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/current_user_entity.dart';
import 'package:feirapp/src/presenter/home/controller/home_controller.dart';
import 'package:feirapp/src/presenter/home/widgets/app_bar_home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = getIt<HomeController>();
  final CurrentUserEntity currentUser = getIt<CurrentUserEntity>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight) / 2;
    final double itemWidth = size.width / 2;

    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: AppStyleValues.small,
      crossAxisSpacing: AppStyleValues.small,
      childAspectRatio: (itemWidth / itemHeight),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 1,
        title: Text(
          'FEIRAPP',
          style: theme.textTheme.titleSmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Column(
              children: [
                Visibility(
                  visible: controller.loading == true,
                  child: const Expanded(
                    child: StandardLoadingWidget(),
                  ),
                ),
                Visibility(
                  visible: controller.loading == false,
                  child: Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList.list(
                          children: [
                            AppBarHomeWidget(
                              name: '${currentUser.data?.name.getFirstName()}',
                            ),
                            const BannerAdWidget(),
                          ],
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(
                            AppStyleValues.small,
                          ),
                          sliver: SliverGrid.builder(
                            itemCount: controller.products.length,
                            gridDelegate: gridDelegate,
                            itemBuilder: (context, index) {
                              final product = controller.products[index];

                              return CardProductWidget(
                                product: product,
                                addProductFunction: () async {},
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
          },
        ),
      ),
    );
  }
}
