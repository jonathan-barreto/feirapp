import 'package:flutter/material.dart';

class StandardLoadingWidget extends StatelessWidget {
  final double? value;

  const StandardLoadingWidget({
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
