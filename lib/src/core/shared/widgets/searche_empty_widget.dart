import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:flutter/material.dart';

class SearchEmptyWidget extends StatelessWidget {
  final String label;

  const SearchEmptyWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.melanciaImage,
        ),
        Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
