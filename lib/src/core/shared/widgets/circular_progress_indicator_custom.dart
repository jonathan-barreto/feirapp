import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

class CircularProgressIndicatorCustom extends StatelessWidget {
  final double? value;

  const CircularProgressIndicatorCustom({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
        value: value,
      ),
    );
  }
}
