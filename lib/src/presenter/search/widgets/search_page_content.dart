import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/card_product_widget.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/core/shared/widgets/feedback_widget.dart';
import 'package:feirapp/src/core/shared/widgets/input_and_filter_button_widget.dart';
import 'package:feirapp/src/presenter/search/controller/search_page_controller.dart';
import 'package:feirapp/src/presenter/search/widgets/bottom_loading_more_products_widget.dart';
import 'package:flutter/material.dart';

class SearchPageContent extends StatelessWidget {
  final SearchPageController controller;
  final VoidCallback openFilterPageOnPressed;
  final VoidCallback clearOnPressed;

  const SearchPageContent({
    super.key,
    required this.controller,
    required this.openFilterPageOnPressed,
    required this.clearOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight) / 2;
    final double itemWidth = size.width / 2;

    return Expanded(
      child: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverList.list(
                children: [
                  InputAndFilterButtonWidget(
                    openFilterOnPressed: openFilterPageOnPressed,
                    onChanged: (value) {
                      controller.searchByProductName(
                        productName: value ?? '',
                      );
                    },
                  ),
                ],
              ),
              SliverVisibility(
                visible: controller.loadingBodyProducts,
                sliver: const SliverFillRemaining(
                  child: StandardLoadingWidget(),
                ),
              ),
              SliverVisibility(
                visible: !controller.loadingBodyProducts &&
                    controller.products.isEmpty,
                sliver: const SliverFillRemaining(
                  child: FeedbackWidget(
                    feedbackMessage: 'Nenhum produto foi encontrado.',
                  ),
                ),
              ),
              SliverVisibility(
                visible: !controller.loadingBodyProducts &&
                    controller.products.isNotEmpty,
                sliver: SliverPadding(
                  padding: const EdgeInsets.all(
                    AppStyleValues.small,
                  ),
                  sliver: SliverGrid.builder(
                    itemCount: controller.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppStyleValues.small,
                      crossAxisSpacing: AppStyleValues.small,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.products[index];

                      return CardProductWidget(
                        product: product,
                        addProductFunction: () async {
                          // await store.addProductInCart(
                          //   product: product,
                          // );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: controller.loadingMoreProducts,
            child: const BottomLoadingMoreProductsWidget(),
          ),
        ],
      ),
    );
  }
}
