import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/presenter/filter/controller/filter_controller.dart';
import 'package:feirapp/src/presenter/filter/widgets/filter_button_for_selection_widget.dart';
import 'package:feirapp/src/presenter/filter/widgets/filter_divider_widget.dart';
import 'package:feirapp/src/presenter/filter/widgets/filter_price_container_widget.dart';
import 'package:flutter/material.dart';

class FilterPageContent extends StatelessWidget {
  final FilterController controller;

  const FilterPageContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    children: controller.categories.asMap().entries.map((e) {
                      return FilterButtonForSelectionWidget(
                        label: e.value.title,
                        isSelected: e.value.isSelected,
                        onPressed: () {
                          controller.setCategoryIsSelected(
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
                    children: controller.orders.asMap().entries.map((e) {
                      return FilterButtonForSelectionWidget(
                        label: e.value.title,
                        isSelected: e.value.isSelected,
                        onPressed: () {
                          controller.setOrderIsSelected(
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
                                label: controller.getStartRangeValue(),
                              ),
                            ),
                            const SizedBox(
                              width: AppStyleValues.normal,
                            ),
                            Expanded(
                              child: FilterPriceContainerWidget(
                                title: 'Para',
                                label: controller.getEndRangeValue(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RangeSlider(
                        values: controller.currentRangeValues,
                        max: 100,
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.mediumGrey,
                        onChanged: (RangeValues values) {
                          controller.rangeValuesNnChanged(
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
      ],
    );
  }
}
