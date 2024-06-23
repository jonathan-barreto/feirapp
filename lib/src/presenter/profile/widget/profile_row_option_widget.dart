import 'package:auto_size_text/auto_size_text.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileRowOptionWidget extends StatelessWidget {
  final String label;
  final IconData iconData;

  const ProfileRowOptionWidget({
    super.key,
    required this.label,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(
          AppStyleValues.medium,
        ),
        child: Row(
          children: [
            Expanded(
              child: FaIcon(
                iconData,
              ),
            ),
            Expanded(
              flex: 7,
              child: AutoSizeText(
                label,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.angleRight,
            ),
          ],
        ),
      ),
    );
  }
}
