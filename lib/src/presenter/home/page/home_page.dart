import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/banner_ad_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/home/state/home_state.dart';
import 'package:sabor_natural_app/src/presenter/home/store/home_store.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/list_view_descounted_products.dart';

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
    final double screenHeight = MediaQuery.of(context).size.height;

    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, value, child) {
        if (value is LoadingState) {
          return const CircularProgressIndicatorCustom();
        }

        if (value is SuccessState<HomeState>) {
          return Column(
            children: [
              SizedBox(
                height: screenHeight * 0.3,
                child: const BannerAdWidget(),
              ),
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Melhores Descontos',
              //         // style: Theme.of(context).textTheme.titleLarge?.copyWith(
              //         //       letterSpacing: 0,
              //         //     ),
              //       ),1
              //     ],
              //   ),
              // ),
              Expanded(
                child: ListViewDescountedProducts(
                  products: value.output.products,
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
