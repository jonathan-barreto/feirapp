import 'package:flutter/material.dart';

class SliverEmptyListWidget extends StatelessWidget {
  const SliverEmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: Text(
          'Lista vazia...',
        ),
      ),
    );
  }
}
