import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/endpoints.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/add_to_cart_button_widget.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/discount_container_widget.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/product_price_widget.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/product_title_widget.dart';

class CardProductWidget extends StatelessWidget {
  final int index;
  final ProductEntity product;

  const CardProductWidget({
    super.key,
    required this.index,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          StyleValues.small,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CachedNetworkImage(
              width: StyleValues.extraLarge * 3,
              imageUrl: '${EndPoints.baseUrlImage}${product.image}',
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return const CircularProgressIndicatorCustom();
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleValues.normal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProductTitleWidget(
                    productName: product.name,
                  ),
                  Visibility(
                    visible: product.discount != null,
                    child: DiscountContainerWidget(
                      discount: product.discount ?? 0,
                    ),
                  ),
                  ProductPriceWidget(
                    price: product.price,
                    discountPrice: product.discountPrice,
                    weight: product.weight,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: StyleValues.normal,
              vertical: StyleValues.small,
            ),
            child: AddToCartButtonWidget(onPressed: () {}),
            // child: Column(
            //   children: [
            //     Visibility(
            //       visible: index % 2 != 0,
            //       child: RowWithActionButtonOnTheLeftWidget(
            //         addProduct: () {},
            //         removeProduct: () {},
            //       ),
            //     ),
            //     Visibility(
            //       visible: index % 2 == 0,
            //       child: RowWithActionButtonOnTheRightWidget(
            //         addProduct: () {},
            //         removeProduct: () {},
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
