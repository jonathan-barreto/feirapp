import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/presenter/login/widgets/container_option_login_widget.dart';

class RowLoginOptionsWidget extends StatelessWidget {
  const RowLoginOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContainerOptionLoginWidget(
          imagePath: AppAssets.appleImage,
        ),
        SizedBox(
          width: StyleValues.extraLarge,
        ),
        ContainerOptionLoginWidget(
          imagePath: AppAssets.googleImage,
        ),
        SizedBox(
          width: StyleValues.extraLarge,
        ),
        ContainerOptionLoginWidget(
          imagePath: AppAssets.facebookImage,
        ),
      ],
    );
  }
}
