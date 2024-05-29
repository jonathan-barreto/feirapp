import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_assets.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/searche_empty_widget.dart';
import 'package:sabor_natural_app/src/init/init.dart';
import 'package:sabor_natural_app/src/presenter/product/controller/product_controller.dart';
import 'package:sabor_natural_app/src/presenter/product/widgets/content_product_page_widget.dart';
import 'package:sabor_natural_app/src/presenter/product/widgets/icon_image_widget.dart';

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

  final String bookmarkFilled = AppAssets.bookmarkFilledIcon;
  final String bookmark = AppAssets.bookmarkIcon;

  @override
  void initState() {
    super.initState();
    controller.getProduct(productId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            actions: [
              Visibility(
                visible: !controller.loading && controller.product != null,
                child: IconButton(
                  onPressed: () => controller.saveProductToFavorites(
                    productId: widget.id,
                  ),
                  icon: IconImageWidget(
                    image: controller.productIsFavorite
                        ? bookmarkFilled
                        : bookmark,
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
                    child: Column(
                      children: [
                        Visibility(
                          visible: controller.product != null,
                          child: Expanded(
                            child: ContentProductPage(
                              product: controller.product,
                              quantity: '${controller.quantity}',
                              // incrementQuantity: controller.incrementQuantity,
                              // decrementQuantity: controller.decrementQuantity,
                              incrementQuantity:
                                  controller.getAllFavoriteProduct,
                              decrementQuantity: controller.remove,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.product == null,
                          child: const Expanded(
                            child: SearchEmptyWidget(
                              label: 'O produto não foi encontrado.',
                            ),
                          ),
                        ),
                      ],
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
