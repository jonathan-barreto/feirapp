import 'package:cached_network_image/cached_network_image.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:flutter/material.dart';

class InternetImageWidget extends StatelessWidget {
  final String url;
  final double? width;

  const InternetImageWidget({
    super.key,
    required this.url,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return const StandardLoadingWidget();
      },
    );
  }
}
