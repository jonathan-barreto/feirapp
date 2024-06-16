import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/core/shared/enums/filter_order_enum.dart';
import 'package:feirapp/src/core/shared/enums/product_category_enum.dart';
import 'package:feirapp/src/core/shared/widgets/base_widget_for_bottom_modal.dart';
import 'package:feirapp/src/core/shared/widgets/filter_category_container_widget.dart';
import 'package:feirapp/src/domain/entities/category_tile_entity.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/search/controllers/search_filter_page_controller.dart';
import 'package:feirapp/src/presenter/search/widgets/elevated_button_custom_widget.dart';
import 'package:feirapp/src/presenter/search/widgets/filter_expansion_tile_widget.dart';
import 'package:feirapp/src/presenter/search/widgets/filter_order_widget.dart';
import 'package:feirapp/src/presenter/search/widgets/range_price_container_widget.dart';

class SearchFilterPage extends StatefulWidget {
  final BuildContext parentContext;
  final List<CategoryTileEntity> categories;
  final double? start;
  final double? end;
  final void Function(ProductCategoryEnum?) radioChange;
  final void Function(RangeValues) rangeSliderChange;
  final FilterOrderEnum? order;
  final void Function(FilterOrderEnum) orderOnChange;
  final VoidCallback searchOnPressed;
  final VoidCallback clearFilters;

  const SearchFilterPage({
    super.key,
    required this.parentContext,
    required this.categories,
    this.start,
    this.end,
    required this.radioChange,
    required this.rangeSliderChange,
    required this.orderOnChange,
    required this.searchOnPressed,
    this.order,
    required this.clearFilters,
  });

  Future<void> _showModal() async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
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
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  final controller = getIt<SearchFilterPageController>();

  @override
  void initState() {
    super.initState();

    controller.init(
      categorieList: widget.categories,
      start: widget.start,
      end: widget.end,
      order: widget.order,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          height: screenHeight * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                StyleValues.normal,
              ),
              topRight: Radius.circular(
                StyleValues.normal,
              ),
            ),
          ),
          child: BaseWidgetForBottomModal(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FilterExpansionTileWidget(
                          label: 'Ordenação',
                          child: FilterOrderWidget(
                            order: controller.myOrder,
                            orderOnChange: (value) {
                              controller.orderChange(
                                value: value,
                              );

                              widget.orderOnChange(
                                value,
                              );
                            },
                          ),
                        ),
                        const Divider(),
                        FilterExpansionTileWidget(
                          label: 'Categoria',
                          child: FilterCategoryContainerWidget(
                            categories: controller.categories,
                            onChange: (index) {
                              final categorySelected = controller.radioChange(
                                index: index,
                              );

                              widget.radioChange(categorySelected.category);
                            },
                          ),
                        ),
                        const Divider(),
                        FilterExpansionTileWidget(
                          label: 'Preço',
                          child: RangePriceContainerWidget(
                            rangeValues: controller.currentRangeValues,
                            onChange: (values) {
                              controller.rangeSliderChange(
                                values: values,
                              );

                              widget.rangeSliderChange(values);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    StyleValues.small,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.06,
                          child: ElevatedButtonCustomWidget.light(
                            label: 'Limpar',
                            onPressed: () {
                              widget.clearFilters();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: StyleValues.small,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.06,
                          child: ElevatedButtonCustomWidget(
                            label: 'Aplicar',
                            onPressed: () {
                              widget.searchOnPressed();
                              Navigator.pop(context);
                            },
                          ),
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
