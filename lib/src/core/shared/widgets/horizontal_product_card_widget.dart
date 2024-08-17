import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/core/shared/widgets/horizontal_product_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

class HorizontalProductCardWidget extends StatelessWidget {
  final ProductEntity product;
  final Widget optionsWidget;

  const HorizontalProductCardWidget({
    super.key,
    required this.product,
    required this.optionsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppStyleValues.small,
      ),
      child: SizedBox(
        width: double.infinity,
        child: SwipeActionCell(
          key: ObjectKey(product),
          trailingActions: <SwipeAction>[
            SwipeAction(
              onTap: (CompletionHandler handler) async {
                // openDialogRemove(
                //   '${product.id}',
                // );
              },
              backgroundRadius: AppStyleValues.normal,
              color: Colors.redAccent,
              icon: const Icon(
                Icons.delete,
                color: AppColors.white,
              ),
            ),
          ],
          child: HorizontalProductContainerWidget(
            product: product,
            optionsWidget: optionsWidget,
          ),
        ),
      ),
    );
  }
}
