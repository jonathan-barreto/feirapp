import 'package:auto_size_text/auto_size_text.dart';
import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:flutter/material.dart';

class FeedbackWidget extends StatelessWidget {
  final String feedbackMessage;

  const FeedbackWidget({
    super.key,
    required this.feedbackMessage,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.melanciaImage,
        ),
        AutoSizeText(
          feedbackMessage,
          maxLines: 1,
          style: theme.textTheme.bodySmall?.copyWith(),
        )
      ],
    );
  }
}
