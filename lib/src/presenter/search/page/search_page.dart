import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';
import 'package:feirapp/src/presenter/filter/page/filter_page.dart';
import 'package:feirapp/src/presenter/search/controller/search_page_controller.dart';
import 'package:feirapp/src/presenter/search/widgets/search_page_content.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchPageController controller = getIt<SearchPageController>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  Future<void> openFilterPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterPage(
          selectedFiltersEntity: controller.selectedFiltersEntity,
          filterOnPressed: (SelectedFiltersEntity filters) {
            controller.setProductsFilterParam(
              filters: filters,
            );
          },
        ),
      ),
    );
  }

  Future<void> searchProductByName(String name) async {
    // await controller.searchByProductName(
    //   productName: name,
    // );

    // if (mounted) {
    //   FocusScope.of(context).unfocus();
    // }
  }

  void clearOnPressed() {
    // controller.clearOnPressed();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.primaryColor,
            elevation: 10,
            title: Text(
              'PRODUTOS',
              style: theme.textTheme.titleSmall?.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  Visibility(
                    visible: controller.loading == true,
                    child: const Expanded(
                      child: Center(
                        child: StandardLoadingWidget(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.loading == false,
                    child: SearchPageContent(
                      controller: controller,
                      openFilterPageOnPressed: openFilterPage,
                      clearOnPressed: clearOnPressed,
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
