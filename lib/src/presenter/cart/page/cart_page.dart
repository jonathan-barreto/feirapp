import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/core/shared/widgets/feedback_widget.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/presenter/cart/controller/cart_controller.dart';
import 'package:feirapp/src/presenter/cart/widgets/cart_page_content_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = getIt<CartController>();

  @override
  void initState() {
    super.initState();
    controller.getSavedProducts();
  }

  Future<void> addQuantity({required ProductEntity product}) async {
    controller.addQuantity(
      product: product,
    );
  }

  Future<void> removeQuantity({required ProductEntity product}) async {
    if (product.quantity == 1) {
      return;
    }

    controller.removeQuantity(
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: controller.loading
                ? const StandardLoadingWidget()
                : controller.products == null
                    ? const Center(
                        child: FeedbackWidget(
                          feedbackMessage: 'Carrinho vazio.',
                        ),
                      )
                    : CartPageContentWidget(
                        products: controller.products ?? [],
                        addQuantity: (ProductEntity product) {
                          addQuantity(product: product);
                        },
                        removeQuantity: (ProductEntity product) {
                          removeQuantity(product: product);
                        },
                      ),
          ),
        );
      },
    );
  }
}
