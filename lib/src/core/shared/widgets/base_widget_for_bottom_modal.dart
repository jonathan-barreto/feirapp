import 'package:flutter/widgets.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

class BaseWidgetForBottomModal extends StatelessWidget {
  final Widget child;

  const BaseWidgetForBottomModal({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(
              StyleValues.smaller,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: StyleValues.small,
                width: StyleValues.largeMedium * 2,
                decoration: BoxDecoration(
                  color: AppColors.secondColorText,
                  borderRadius: BorderRadius.circular(
                    StyleValues.small,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
