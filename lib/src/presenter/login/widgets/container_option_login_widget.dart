import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';

class ContainerOptionLoginWidget extends StatelessWidget {
  final String imagePath;

  const ContainerOptionLoginWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: StyleValues.extraLarge * 1.2,
      width: StyleValues.extraLarge * 1.2,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(
          StyleValues.small,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: StyleValues.large,
          )
        ],
      ),
    );
  }
}
