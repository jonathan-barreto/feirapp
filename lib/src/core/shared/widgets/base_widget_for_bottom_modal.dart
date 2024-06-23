import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/widgets.dart';

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
              AppStyleValues.smaller,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: AppStyleValues.small,
                width: AppStyleValues.largeMedium * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppStyleValues.small,
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
