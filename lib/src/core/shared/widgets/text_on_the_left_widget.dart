import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextOnTheLeftWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextOnTheLeftWidget({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          text,
          maxLines: 1,
          style: style,
        ),
      ],
    );
  }
}