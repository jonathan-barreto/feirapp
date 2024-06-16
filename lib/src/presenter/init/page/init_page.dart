import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:feirapp/src/di/di.dart';
import 'package:feirapp/src/presenter/init/controller/init_controller.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final InitController controller = getIt<InitController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          AppAssets.logo,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'FEIRAPP',
                              style: themeData.textTheme.bodyLarge?.copyWith(
                                fontSize: StyleValues.extraLarge,
                                fontWeight: FontWeight.w900,
                                color: AppColors.primary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: StyleValues.large,
                              ),
                              child: Text(
                                'É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível',
                                textAlign: TextAlign.center,
                                style: themeData.textTheme.bodySmall?.copyWith(
                                  color: AppColors.mediumGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        width: StyleValues.extraLarge * 6,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  StyleValues.normal,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            'Entrar',
                            style: themeData.textTheme.bodySmall?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
