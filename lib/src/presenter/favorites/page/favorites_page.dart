import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/favorites/controller/favorites_controller.dart';
import 'package:feirapp/src/presenter/favorites/widgets/favorites_page_content_widget.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesController controller = getIt<FavoritesController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    final String? errorMessage = await controller.init();

    if (errorMessage != null) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          // backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text(
              'Favoritos',
              style: theme.textTheme.titleSmall?.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Visibility(
                  visible: controller.loading,
                  child: const Expanded(
                    child: StandardLoadingWidget(),
                  ),
                ),
                Visibility(
                  visible: !controller.loading,
                  child: Expanded(
                    child: Column(
                      children: [
                        Visibility(
                          visible: controller.products == null,
                          child: Expanded(
                            child: Container(
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.products != null,
                          child: FavoritesPageContentWidget(
                            products: controller.products ?? [],
                          ),
                        ),
                      ],
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
