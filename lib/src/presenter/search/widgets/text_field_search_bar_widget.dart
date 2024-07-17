import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    final ThemeData themeData = Theme.of(context);

    return Expanded(
      child: TextField(
        controller: widget.controller,
        style: themeData.textTheme.bodyMedium?.copyWith(),
        cursorColor: themeData.colorScheme.tertiary,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          border: const OutlineInputBorder(),
          hintText: 'Pesquisar',
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
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
              ),
            ),
          ),
          hintStyle: themeData.textTheme.bodySmall?.copyWith(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
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
