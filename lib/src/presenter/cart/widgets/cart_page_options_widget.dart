import 'package:feirapp/src/core/shared/widgets/add_button_widget.dart';
import 'package:feirapp/src/core/shared/widgets/remove_button_widget.dart';
import 'package:flutter/material.dart';

class CartPageOptionsWidget extends StatelessWidget {
  final String productQuantity;
  final VoidCallback addQuantity;
  final VoidCallback removeQuantity;

  const CartPageOptionsWidget({
    super.key,
    required this.productQuantity,
    required this.addQuantity,
    required this.removeQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RemoveButtonWidget(
          onPressed: removeQuantity,
        ),
        Text(
          productQuantity,
          style: theme.textTheme.bodyMedium?.copyWith(),
        ),
        AddButtonWidget(
          onPressed: addQuantity,
        ),
      ],
    );
  }
}
