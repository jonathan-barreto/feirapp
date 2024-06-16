import 'package:feirapp/src/core/shared/constants/style_values.dart';
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
              StyleValues.smaller,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: StyleValues.small,
                width: StyleValues.largeMedium * 2,
                decoration: BoxDecoration(
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
