import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/presenter/product/widgets/favorite_icon_widget.dart';
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
    controller.getProduct(productId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: theme.colorScheme.primary,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            iconTheme: theme.iconTheme.copyWith(
              color: AppColors.white,
            ),
            actions: [
              Visibility(
                visible: !controller.loading && controller.product != null,
                child: FavoriteIconWidget(
                  isFavorite: controller.productIsFavorite,
                  saveProductOnPressed: () => controller.saveProductToFavorites(
                    productId: widget.id,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Visibility(
                  visible: controller.loading,
                  child: const Expanded(
                    child: Center(
                      child: CircularProgressIndicatorCustom(),
                    ),
                  ),
                ),
                Visibility(
                  visible: !controller.loading,
                  child: Expanded(
                    child: ContentProductPage(
                      product: controller.product,
                      productPrice: controller.productPrice ?? '',
                      quantity: '${controller.quantity}',
                      incrementQuantity: controller.incrementQuantity,
                      decrementQuantity: controller.decrementQuantity,
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
