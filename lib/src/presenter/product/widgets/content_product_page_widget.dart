import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/endpoints.dart';
import 'package:feirapp/src/core/shared/extensions/string_converter_to_brl_extension.dart';
import 'package:feirapp/src/core/shared/extensions/upper_case_first_letter_extension.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ContentProductPage extends StatelessWidget {
  final ProductEntity? product;
  final String productPrice;
  final String quantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const ContentProductPage({
    super.key,
    required this.product,
    required this.productPrice,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: StyleValues.small,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl: '${EndPoints.baseUrlImage}${product?.image}',
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return const CircularProgressIndicatorCustom();
                    },
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  product?.name ?? '',
                                  style: textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Categoria: ${product?.category}',
                                  style: textTheme.bodySmall?.copyWith(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  '${product?.unit.upperCaseFirstLetter()}:',
                                  maxLines: 1,
                                  style: textTheme.bodySmall?.copyWith(),
                                ),
                                Visibility(
                                  visible: product?.weight != null,
                                  child: Expanded(
                                    child: AutoSizeText(
                                      ' aprox. ${product?.weight}',
                                      maxLines: 1,
                                      style: textTheme.bodySmall?.copyWith(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RatingStars(
                                        value: 0,
                                        onValueChanged: (v) {},
                                        valueLabelVisibility: false,
                                        maxValueVisibility: false,
                                        starCount: 5,
                                        starSpacing: 2,
                                        starSize: StyleValues.large,
                                        starOffColor: const Color(0xffe7e8ea),
                                        starColor: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: StyleValues.smaller,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '(0 Reviews)',
                                  style: textTheme.bodySmall?.copyWith(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                StyleValues.large,
              ),
              topRight: Radius.circular(
                StyleValues.large,
              ),
            ),
            child: Container(
              color: AppColors.primary,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        productPrice.converterToBRL(),
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: StyleValues.extraLarge * 1.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.white,
                              width: StyleValues.extraSmall,
                            ),
                            borderRadius: BorderRadius.circular(
                              StyleValues.normal,
                            ),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: decrementQuantity,
                                icon: const Icon(
                                  Icons.remove,
                                  color: AppColors.white,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: AutoSizeText(
                                    quantity,
                                    maxLines: 1,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: incrementQuantity,
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                StyleValues.normal,
                              ),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                            AppColors.white,
                          ),
                        ),
                        child: const Icon(
                          Icons.save,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
