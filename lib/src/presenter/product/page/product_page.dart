import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/product/controller/product_controller.dart';
import 'package:feirapp/src/presenter/product/widgets/content_product_page_widget.dart';

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage({
    super.key,
    required this.id,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController controller = getIt<ProductController>();

  @override
  void initState() {
    super.initState();

    controller.init(
      id: widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: theme.colorScheme.primary,
          appBar: AppBar(),
          body: SafeArea(
            child: Column(
              children: [
                Visibility(
                  visible: controller.loading,
                  child: const Expanded(
                    child: Center(
                      child: StandardLoadingWidget(),
                    ),
                  ),
                ),
                Visibility(
                  visible: !controller.loading,
                  child: Expanded(
                    child: ContentProductPage(
                      isFavorite: controller.productIsFavorite,
                      saveOnPressed: controller.saveOrRemoveProductToFavorites,
                      product: controller.product,
                      productPrice: controller.productPrice ?? '',
                      quantity: '${controller.quantity}',
                      increment: controller.incrementQuantity,
                      decrement: controller.decrementQuantity,
                    ),
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
