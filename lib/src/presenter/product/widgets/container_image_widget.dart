import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/endpoints.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';

class ContainerImageWidget extends StatelessWidget {
  final String imageUrl;

  const ContainerImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(
        StyleValues.normal,
      ),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.3,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(
            StyleValues.small,
          ),
        ),
        child: CachedNetworkImage(
          width: StyleValues.extraLarge * 3,
          imageUrl: '${EndPoints.baseUrlImage}$imageUrl',
          errorWidget: (context, url, error) => const Icon(Icons.error),
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return const CircularProgressIndicatorCustom();
          },
        ),
      ),
    );
  }
}
