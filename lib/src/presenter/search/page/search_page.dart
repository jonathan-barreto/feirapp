import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/card_product_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/search/state/search_state.dart';
import 'package:sabor_natural_app/src/presenter/search/store/search_store.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/bottom_loading_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchStore store = getIt<SearchStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    await store.getAllProducts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight) / 2;
    final double itemWidth = size.width / 2;

    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, value, child) {
        if (value is LoadingState) {
          return const CircularProgressIndicatorCustom();
        }

        if (value is SuccessState<SearchState>) {
          return Stack(
            children: [
              CustomScrollView(
                controller: store.scrollController,
                slivers: [
                  SliverVisibility(
                    visible: value.output.products.isEmpty,
                    sliver: const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Lista vazia...',
                        ),
                      ),
                    ),
                  ),
                  SliverVisibility(
                    visible: value.output.products.isNotEmpty,
                    sliver: SliverPadding(
                      padding: const EdgeInsets.all(
                        StyleValues.small,
                      ),
                      sliver: SliverGrid.builder(
                        itemCount: value.output.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: StyleValues.small,
                          crossAxisSpacing: StyleValues.small,
                          childAspectRatio: (itemWidth / itemHeight),
                        ),
                        itemBuilder: (context, index) {
                          final product = value.output.products[index];

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
                visible: value.output.loadingMoreProducts,
                child: const BottomLoadingWidget(),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
