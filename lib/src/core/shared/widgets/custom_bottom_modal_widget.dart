import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/base_widget_for_bottom_modal.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/filter_category_container_widget.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/price_container_widget.dart';

class FilterBottomModalWidget extends StatefulWidget {
  final BuildContext parentContext;

  const FilterBottomModalWidget({
    super.key,
    required this.parentContext,
  });

  Future<void> _showModal() async {
    return showModalBottomSheet(
      backgroundColor: AppColors.lightGrey,
      context: parentContext,
      enableDrag: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return this;
      },
    );
  }

  Future<void> show() => Future<void>.microtask(() => _showModal());

  @override
  State<FilterBottomModalWidget> createState() =>
      _FilterBottomModalWidgetState();
}

class _FilterBottomModalWidgetState extends State<FilterBottomModalWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return BaseWidgetForBottomModal(
      child: Column(
        children: [
          Text(
            'Filtro',
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const FilterCategoryContainerWidget(),
                  Padding(
                    padding: const EdgeInsets.all(
                      StyleValues.normal,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          StyleValues.smaller,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Preço',
                                style: textTheme.bodyMedium?.copyWith(),
                              ),
                            ],
                          ),
                          RangeSlider(
                            values: _currentRangeValues,
                            max: 100,
                            activeColor: AppColors.primary,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: PricoContainerWidget(
                                  value: _currentRangeValues.start
                                      .toStringAsFixed(2),
                                ),
                              ),
                              Text(
                                '-',
                                style: textTheme.bodyMedium?.copyWith(),
                              ),
                              Expanded(
                                child: PricoContainerWidget(
                                  value: _currentRangeValues.end
                                      .toStringAsFixed(2),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: StyleValues.extraLarge * 1.5,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
