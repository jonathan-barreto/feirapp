import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

class ProductPriceWidget extends StatelessWidget {
  final String price;
  final String? discountPrice;
  final String? weight;

  const ProductPriceWidget({
    super.key,
    required this.price,
    this.discountPrice,
    this.weight,
  });

  String getPriceFormated({required String value}) {
    final String priceFormated = value.replaceAll('.', ',');

    final List<String> strings = priceFormated.split('');

    if (strings.length == 3) {
      return 'R\$ ${priceFormated}0';
    }

    return 'R\$ $priceFormated';
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Visibility(
          visible: discountPrice == null,
          child: Text(
            getPriceFormated(value: price),
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Visibility(
          visible: discountPrice != null,
          child: Row(
            children: [
              Text(
                getPriceFormated(value: price),
                style: textTheme.bodySmall?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: discountPrice != null,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  getPriceFormated(value: discountPrice ?? ''),
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: weight != null,
                child: Expanded(
                  child: AutoSizeText(
                    '(Aprox. $weight)',
                    maxLines: 1,
                    style: textTheme.bodySmall?.copyWith(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}