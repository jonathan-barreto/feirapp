import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/core/shared/widgets/card_product_widget.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/search/controllers/search_page_controller.dart';
import 'package:feirapp/src/presenter/search/widgets/bottom_loading_more_products_widget.dart';
import 'package:feirapp/src/presenter/search/widgets/search_bar_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight) / 2;
    final double itemWidth = size.width / 2;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Visibility(
                visible: controller.pageLoading == true,
                child: const Expanded(
                  child: Center(
                    child: CircularProgressIndicatorCustom(),
                  ),
                ),
              ),
              Visibility(
                visible: controller.pageLoading == false,
                child: Expanded(
                  child: Stack(
                    children: [
                      CustomScrollView(
                        controller: controller.scrollController,
                        slivers: [
                          SliverList.list(
                            children: [
                              Container(
                                height: StyleValues.extraLarge * 2,
                                color: AppColors.white,
                                child: SearchBarWidget(
                                  textController: controller.textController,
                                  onPressed: () {
                                    controller.showFilterOptions(
                                      context: context,
                                    );
                                  },
                                  clearPressed: () {},
                                  onChange: (value) {
                                    controller.searchByProductName(
                                      productName: value,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SliverVisibility(
                            visible: controller.products.isEmpty,
                            sliver: const SliverFillRemaining(
                              child: Center(
                                child: Text(
                                  'Lista vazia...',
                                ),
                              ),
                            ),
                          ),
                          SliverVisibility(
                            visible: controller.productLoading == true,
                            sliver: const SliverFillRemaining(
                              child: Center(
                                child: CircularProgressIndicatorCustom(),
                              ),
                            ),
                          ),
                          SliverVisibility(
                            visible: controller.productLoading == false,
                            sliver: SliverVisibility(
                              visible: controller.products.isNotEmpty,
                              sliver: SliverPadding(
                                padding: const EdgeInsets.all(
                                  StyleValues.small,
                                ),
                                sliver: SliverGrid.builder(
                                  itemCount: controller.products.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: StyleValues.small,
                                    crossAxisSpacing: StyleValues.small,
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
                          ),
                        ],
                      ),
                      Visibility(
                        visible: controller.loadingMoreProducts,
                        child: const BottomLoadingMoreProductsWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
