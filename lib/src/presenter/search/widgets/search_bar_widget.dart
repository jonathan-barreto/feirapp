import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/presenter/search/widgets/filter_button_widget.dart';
import 'package:feirapp/src/presenter/search/widgets/text_field_search_bar_widget.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onPressed;
  final VoidCallback clearPressed;
  final void Function(String) onChange;

  const SearchBarWidget({
    super.key,
    required this.textController,
    required this.onPressed,
    required this.clearPressed,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.small,
      ),
      child: Row(
        children: [
          TextFieldSearchBarWidget(
            controller: textController,
            clearPressed: () => clearPressed(),
            onChange: (value) => onChange(value),
          ),
          const SizedBox(
            width: AppStyleValues.small,
          ),
          FilterButtonWidget(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
