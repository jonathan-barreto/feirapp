import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/filter_entity.dart';
import 'package:feirapp/src/presenter/search/stores/filter_store.dart';
import 'package:feirapp/src/presenter/search/widgets/filter_divider_widget.dart';
import 'package:feirapp/src/presenter/search/widgets/filter_elevated_button.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  final FilterEntity? filterEntity;
  final void Function(FilterEntity) filterOnPressed;

  const FilterPage({
    super.key,
    this.filterEntity,
    required this.filterOnPressed,
  });

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final FilterStore store = getIt<FilterStore>();

  void filterOnPressed() {
    final FilterEntity filterEntity = store.getFilterEntity();

    widget.filterOnPressed(filterEntity);

    Navigator.pop(context);
  }

  void clearFilter() {
    store.clearFilter();

    final FilterEntity filterEntity = store.getFilterEntity();

    widget.filterOnPressed(filterEntity);
  }

  @override
  void initState() {
    super.initState();

    store.init(
      filter: widget.filterEntity,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: store,
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
            child: store.loading
                ? const StandardLoadingWidget()
                : Column(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppStyleValues.small,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: AppStyleValues.small,
                              ),
                              FilterDividerWidget(
                                label: 'Categoria',
                                child: Wrap(
                                  spacing: AppStyleValues.normal,
                                  children:
                                      store.categories.asMap().entries.map((e) {
                                    return FilterButtonForSelectionWidget(
                                      label: e.value.title,
                                      isSelected: e.value.isSelected,
                                      onPressed: () {
                                        store.setCategoryIsSelected(
                                          index: e.key,
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: AppStyleValues.extraLarge,
                              ),
                              FilterDividerWidget(
                                label: 'Ordem',
                                child: Wrap(
                                  spacing: AppStyleValues.normal,
                                  children:
                                      store.orders.asMap().entries.map((e) {
                                    return FilterButtonForSelectionWidget(
                                      label: e.value.title,
                                      isSelected: e.value.isSelected,
                                      onPressed: () {
                                        store.setOrderIsSelected(
                                          index: e.key,
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: AppStyleValues.extraLarge,
                              ),
                              FilterDividerWidget(
                                label: 'Preço',
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppStyleValues.normal,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: FilterPriceContainerWidget(
                                              title: 'De',
                                              label: store.getStartRangeValue(),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: AppStyleValues.normal,
                                          ),
                                          Expanded(
                                            child: FilterPriceContainerWidget(
                                              title: 'Para',
                                              label: store.getEndRangeValue(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RangeSlider(
                                      values: store.currentRangeValues,
                                      max: 100,
                                      activeColor: AppColors.primary,
                                      inactiveColor: AppColors.mediumGrey,
                                      onChanged: (RangeValues values) {
                                        store.rangeValuesNnChanged(
                                          values: values,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppStyleValues.small,
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
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class FilterPriceContainerWidget extends StatelessWidget {
  final String title;
  final String label;

  const FilterPriceContainerWidget({
    super.key,
    required this.title,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppStyleValues.extraSmall,
        ),
        Container(
          width: double.maxFinite,
          height: AppStyleValues.extraLarge,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.darkGrey),
            borderRadius: BorderRadius.circular(
              AppStyleValues.small,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterButtonForSelectionWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButtonForSelectionWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const ligthGrey = MaterialStatePropertyAll(AppColors.lightGrey);
    const green = MaterialStatePropertyAll(AppColors.primary);

    final ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: isSelected ? green : ligthGrey,
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppStyleValues.small,
            ),
          ),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isSelected ? AppColors.white : AppColors.darkGrey,
        ),
      ),
    );
  }
}
