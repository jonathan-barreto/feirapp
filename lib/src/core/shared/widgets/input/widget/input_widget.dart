import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/input/controller/input_widget_controller.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String? initText;
  final void Function(String?) onChanged;

  const InputWidget({
    super.key,
    this.initText,
    required this.onChanged,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final InputWidgetController controller = getIt<InputWidgetController>();

  @override
  void initState() {
    super.initState();

    controller.initController(
      initText: widget.initText,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return TextField(
          controller: controller.textController,
          cursorColor: AppColors.darkGrey,
          style: theme.textTheme.bodyMedium?.copyWith(),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.lightGrey,
            border: const OutlineInputBorder(),
            hintText: 'Pesquisar...',
            hintStyle: theme.textTheme.bodyMedium?.copyWith(),
            suffixIcon: Visibility(
              visible: controller.showClear,
              child: IconButton(
                onPressed: () {
                  controller.textController.clear();
                  
                  widget.onChanged(
                    null,
                  );
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.mediumGrey,
              ),
              borderRadius: BorderRadius.circular(
                AppStyleValues.smaller,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.mediumGrey,
              ),
              borderRadius: BorderRadius.circular(
                AppStyleValues.smaller,
              ),
            ),
          ),
          onChanged: (value) {
            controller.changeShowClear(
              value: value,
            );

            widget.onChanged(
              value,
            );
          },
        );
      },
    );
  }
}
