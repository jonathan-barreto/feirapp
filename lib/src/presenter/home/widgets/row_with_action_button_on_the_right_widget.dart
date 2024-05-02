import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/left_action_button_widget.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/right_action_button_widget.dart';

class RowWithActionButtonOnTheRightWidget extends StatelessWidget {
  final VoidCallback addProduct;
  final VoidCallback removeProduct;

  const RowWithActionButtonOnTheRightWidget({
    super.key,
    required this.addProduct,
    required this.removeProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RightActionButtonWidget(
          onPressed: () => addProduct(),
        ),
        const Expanded(
          child: Center(
            child: Text('0'),
          ),
        ),
        LeftActionButtonWidget(
          onPressed: () => removeProduct(),
        ),
      ],
    );
  }
}
