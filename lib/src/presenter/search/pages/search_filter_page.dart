import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/enums/product_category_enum.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/base_widget_for_bottom_modal.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/filter_category_container_widget.dart';
import 'package:sabor_natural_app/src/domain/entities/category_tile_entity.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/search/controllers/search_filter_page_controller.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/range_price_container_widget.dart';

class SearchFilterPage extends StatefulWidget {
  final BuildContext parentContext;
  final List<CategoryTileEntity> categories;
  final double? start;
  final double? end;
  final void Function(ProductCategoryEnum?) radioChange;
  final void Function(RangeValues) rangeSliderChange;
  final VoidCallback searchOnPressed;

  const SearchFilterPage({
    super.key,
    required this.parentContext,
    required this.categories,
    this.start,
    this.end,
    required this.radioChange,
    required this.rangeSliderChange,
    required this.searchOnPressed,
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
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          height: screenHeight * 0.8,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              StyleValues.normal,
            ),
          ),
          child: BaseWidgetForBottomModal(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      // const Divider(),
                      FilterCategoryContainerWidget(
                        categories: controller.categories,
                        onChange: (index) {
                          final categorySelected = controller.radioChange(
                            index: index,
                          );

                          widget.radioChange(categorySelected.category);
                        },
                      ),
                      const Divider(),
                      RangePriceContainerWidget(
                        rangeValues: controller.currentRangeValues,
                        onChange: (values) {
                          controller.rangeSliderChange(
                            values: values,
                          );

                          widget.rangeSliderChange(values);
                        },
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    StyleValues.normal,
                  ),
                  child: ElevatedButtonCustomWidget(
                    label: 'Aplicar',
                    onPressed: () {
                      widget.searchOnPressed();
                      Navigator.pop(context);
                    },
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

class ElevatedButtonCustomWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ElevatedButtonCustomWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primary,
          ),
          side: MaterialStatePropertyAll(BorderSide()),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(),
          ),
        ),
        child: Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
