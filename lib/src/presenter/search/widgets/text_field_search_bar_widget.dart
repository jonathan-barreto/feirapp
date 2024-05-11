import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

class TextFieldSearchBarWidget extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback clearPressed;
  final void Function(String) onChange;

  const TextFieldSearchBarWidget({
    super.key,
    required this.controller,
    required this.onChange,
    required this.clearPressed,
  });

  @override
  State<TextFieldSearchBarWidget> createState() =>
      _TextFieldSearchBarWidgetState();
}

class _TextFieldSearchBarWidgetState extends State<TextFieldSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: TextField(
        controller: widget.controller,
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.primaryColorText,
        ),
        cursorColor: AppColors.primaryColorText,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          border: const OutlineInputBorder(),
          labelText: 'Pesquisar',
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: AppColors.primaryColorText,
            ),
          ),
          suffixIcon: Visibility(
            visible: widget.controller.text.isNotEmpty,
            child: IconButton(
              onPressed: () {
                widget.clearPressed();

                setState(() {
                  widget.controller.clear();
                });
              },
              icon: const Icon(
                Icons.clear,
                color: AppColors.primaryColorText,
              ),
            ),
          ),
          labelStyle: textTheme.bodySmall?.copyWith(
            color: AppColors.primaryColorText,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColorText,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColorText,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {
            widget.onChange(value);
          });
        },
      ),
    );
  }
}
