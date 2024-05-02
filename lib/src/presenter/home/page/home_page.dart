import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/banner_ad_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/home/state/home_state.dart';
import 'package:sabor_natural_app/src/presenter/home/store/home_store.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/app_bar_home_widget.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/card_product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();

    store.getDiscountedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, value, child) {
        if (value is LoadingState) {
          return const CircularProgressIndicatorCustom();
        }

        if (value is SuccessState<HomeState>) {
          final Size size = MediaQuery.of(context).size;

          final double itemHeight = (size.height - kToolbarHeight) / 2;
          final double itemWidth = size.width / 2;

          return CustomScrollView(
            slivers: [
              SliverList.list(
                children: const [
                  AppBarHomeWidget(),
                  BannerAdWidget(),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: StyleValues.small,
                ),
                sliver: SliverGrid.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: StyleValues.small,
                    crossAxisSpacing: StyleValues.small,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (context, index) {
                    final ProductEntity product = value.output.products[index];

                    return CardProductWidget(
                      index: index,
                      product: product,
                    );
                  },
                ),
              ),
            ],
          );
        }

        if (value is ErrorState) {
          return Center(
            child: Text(value.message),
          );
        }

        return Container();
      },
    );
  }
}
