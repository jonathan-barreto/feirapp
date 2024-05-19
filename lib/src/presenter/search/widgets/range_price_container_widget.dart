import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/price_container_widget.dart';

class RangePriceContainerWidget extends StatelessWidget {
  final RangeValues rangeValues;
  final void Function(RangeValues) onChange;

  const RangePriceContainerWidget({
    super.key,
    required this.rangeValues,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleValues.smaller,
      ),
      child: Column(
        children: [
          RangeSlider(
            values: rangeValues,
            max: 100,
            activeColor: AppColors.primary,
            onChanged: (RangeValues values) => onChange(values),
            labels: RangeLabels(
              '${rangeValues.start.round()}',
              '${rangeValues.end.round()}',
            ),
          ),
          const SizedBox(
            height: StyleValues.normal,
          ),
          Row(
            children: [
              Expanded(
                child: PriceContainerWidget(
                  value: rangeValues.start.toStringAsFixed(2),
                ),
              ),
              Text(
                '-',
                style: textTheme.bodySmall?.copyWith(),
              ),
              Expanded(
                child: PriceContainerWidget(
                  value: rangeValues.end.toStringAsFixed(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
