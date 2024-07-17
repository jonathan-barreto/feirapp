import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';
import 'package:feirapp/src/presenter/filter/controller/filter_controller.dart';
import 'package:feirapp/src/presenter/filter/widgets/filter_elevated_button.dart';
import 'package:feirapp/src/presenter/filter/widgets/filter_page_content.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  final SelectedFiltersEntity? selectedFiltersEntity;
  final void Function(SelectedFiltersEntity) filterOnPressed;

  const FilterPage({
    super.key,
    this.selectedFiltersEntity,
    required this.filterOnPressed,
  });

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final FilterController controller = getIt<FilterController>();

  @override
  void initState() {
    super.initState();

    controller.init(
      filter: widget.selectedFiltersEntity,
    );
  }

  void filterOnPressed() {
    final SelectedFiltersEntity selectedFilters =
        controller.getSelectedFilters();

    widget.filterOnPressed(
      selectedFilters,
    );

    Navigator.pop(context);
  }

  void clearFilter() {
    controller.clearFilter();

    final SelectedFiltersEntity selectedFilters =
        controller.getSelectedFilters();

    widget.filterOnPressed(
      selectedFilters,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text(
              'Filtro',
              style: theme.textTheme.bodySmall,
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
                    child: FilterPageContent(
                      controller: controller,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    AppStyleValues.small,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: FilterElevatedButton(
                          label: 'Limpar',
                          isBorded: true,
                          onPressed: clearFilter,
                        ),
                      ),
                      const SizedBox(
                        width: AppStyleValues.small,
                      ),
                      Expanded(
                        child: FilterElevatedButton(
                          label: 'Filtrar',
                          onPressed: filterOnPressed,
                        ),
                      ),
                    ],
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
