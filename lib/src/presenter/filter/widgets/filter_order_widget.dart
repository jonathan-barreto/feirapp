import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/enums/filter_order_enum.dart';

class FilterOrderWidget extends StatelessWidget {
  final FilterOrderEnum? order;
  final void Function(FilterOrderEnum) orderOnChange;

  const FilterOrderWidget({
    super.key,
    this.order,
    required this.orderOnChange,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    FilterOrderEnum? character = order ?? FilterOrderEnum.asc;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.normal,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppStyleValues.small,
                  ),
                  child: Text(
                    'Crescente ',
                    style: textTheme.bodySmall?.copyWith(),
                  ),
                ),
              ),
              Radio<FilterOrderEnum>(
                value: FilterOrderEnum.asc,
                groupValue: character,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  if (value != null) orderOnChange(value);
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppStyleValues.small,
                  ),
                  child: Text(
                    'Decrescente',
                    style: textTheme.bodySmall?.copyWith(),
                  ),
                ),
              ),
              Radio<FilterOrderEnum>(
                value: FilterOrderEnum.desc,
                groupValue: character,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  if (value != null) orderOnChange(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
