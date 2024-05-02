import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/left_action_button_widget.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/right_action_button_widget.dart';

class RowWithActionButtonOnTheLeftWidget extends StatelessWidget {
  final VoidCallback addProduct;
  final VoidCallback removeProduct;

  const RowWithActionButtonOnTheLeftWidget({
    super.key,
    required this.addProduct,
    required this.removeProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LeftActionButtonWidget(
          onPressed: () => removeProduct(),
        ),
        const Expanded(
          child: Center(
            child: Text('0'),
          ),
        ),
        RightActionButtonWidget(
          onPressed: () => addProduct(),
        ),
      ],
    );
  }
}
