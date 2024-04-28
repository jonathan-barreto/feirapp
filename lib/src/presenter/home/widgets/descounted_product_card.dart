import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/endpoints.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';

class DescountedProductCard extends StatelessWidget {
  final ProductEntity product;

  const DescountedProductCard({
    super.key,
    required this.product,
  });

  String replace({required String text}) {
    final String newText = text.replaceAll('.00', '');
    return '-$newText%';
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                          child: CircularProgressIndicatorCustom(
                            value: progress.progress,
                          ),
                        );
                      },
                      imageUrl: '${EndPoints.baseUrlImage}${product.image}',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: double.parse('${product.discount}') != 0,
              child: Positioned(
                top: 5,
                right: 5,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      replace(text: '${product.discount}'),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15,
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
