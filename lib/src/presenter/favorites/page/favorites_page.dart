import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/core/shared/widgets/feedback_widget.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/favorites/controller/favorites_controller.dart';
import 'package:feirapp/src/presenter/favorites/widgets/favorites_page_content_widget.dart';
import 'package:feirapp/src/presenter/filter/page/filter_page.dart';
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

  Future<void> removeProductFromFavorites({required String id}) async {
    final String? errorMessage = await controller.removeProductFromFavorites(
      id: id,
    );
  }

  Future<void> dialogRemove({required String productId}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: AppStyleValues.extraLarge * 5,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    AppAssets.melanciaImage,
                    width: AppStyleValues.extraLarge * 5,
                  ),
                ),
                Text(
                  'Você tem certeza que deseja remover este produto?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Remover',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.redAccent,
                    ),
              ),
              onPressed: () {
                removeProductFromFavorites(
                  id: productId,
                );

                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Sair',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> openFilterPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterPage(
          filterOnPressed: (filters) {
            controller.getFavoritesProductsByFilters(
              filters: filters,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.primaryColor,
            elevation: 1,
            title: Text(
              'FAVORITOS',
              style: theme.textTheme.titleSmall?.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: controller.products == null,
                            child: const FeedbackWidget(
                              feedbackMessage: 'Nenhum produto foi salvo.',
                            ),
                          ),
                          Visibility(
                            visible: controller.products != null,
                            child: FavoritesPageContentWidget(
                              products: controller.products ?? [],
                              filterLoading: controller.filterLoading,
                              openDialogRemove: (String productId) {
                                dialogRemove(
                                  productId: productId,
                                );
                              },
                              openFilter: openFilterPage,
                            ),
                          ),
                        ],
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
  }
}
