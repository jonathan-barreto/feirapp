import 'package:flutter/material.dart';

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
