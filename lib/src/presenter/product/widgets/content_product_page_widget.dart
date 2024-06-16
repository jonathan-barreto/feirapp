import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/core/shared/widgets/product_price_widget.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/presenter/product/widgets/action_button_widget.dart';
import 'package:feirapp/src/presenter/product/widgets/container_image_widget.dart';

class ContentProductPage extends StatelessWidget {
  final ProductEntity? product;
  final String quantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const ContentProductPage({
    super.key,
    required this.product,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              ContainerImageWidget(
                imageUrl: product?.image ?? '',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: StyleValues.normal,
                ),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      StyleValues.normal,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product?.name ?? '',
                                  maxLines: 1,
                                  style: textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ProductPriceWidget(
                              price: product?.price ?? '',
                              discountPrice: product?.discountPrice,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(
                              StyleValues.extraLarge,
                            ),
                          ),
                          child: Row(
                            children: [
                              ActionButtonWidget(
                                isAdd: false,
                                onPressed: decrementQuantity,
                              ),
                              AutoSizeText(
                                quantity,
                                maxLines: 1,
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ActionButtonWidget(
                                onPressed: incrementQuantity,
                              ),
                            ],
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
        Container(
          width: double.infinity,
          height: screenHeight * 0.1,
          padding: const EdgeInsets.symmetric(
            vertical: StyleValues.small,
            horizontal: StyleValues.normal,
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(
                0,
              ),
            ),
            child: Text(
              'Adicionar ao Carrinho',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
