import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/search/search_state.dart';
import 'package:sabor_natural_app/src/presenter/search/search_store.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/bottom_loading_widget.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/search_bar_widget.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/sliver_empty_list_widget.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/sliver_grid_products_widget.dart';

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
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, value, child) {
        if (value is LoadingState) {
          return const CircularProgressIndicatorCustom();
        }

        if (value is SuccessState<SearchState>) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                CustomScrollView(
                  controller: store.scrollController,
                  slivers: [
                    SliverList.list(
                      children: [
                        Container(
                          height: StyleValues.extraLarge * 2,
                          color: AppColors.white,
                          child: SearchBarWidget(
                            textController: store.textController,
                            onPressed: () => store.showFilterOptions(
                              context: context,
                            ),
                            clearPressed: () {},
                            onChange: (value) {},
                          ),
                        ),
                      ],
                    ),
                    SliverVisibility(
                      visible: value.output.products.isEmpty,
                      sliver: const SliverEmptyListWidget(),
                    ),
                    SliverVisibility(
                      visible: value.output.products.isNotEmpty,
                      sliver: SliverGridProductsWidget(
                        products: value.output.products,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: value.output.loadingMoreProducts,
                  child: const BottomLoadingWidget(),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
