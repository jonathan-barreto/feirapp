import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/style_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.lightGrey,
      colorScheme: const ColorScheme.light(
        background: AppColors.lightGrey,
        primary: AppColors.white,
        secondary: AppColors.darkGrey,
        onSecondary: AppColors.mediumGrey,
      ),
      dividerColor: AppColors.mediumGrey,
      dividerTheme: const DividerThemeData(
        color: AppColors.mediumGrey,
      ),
      cardColor: AppColors.white,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.poppins(
          letterSpacing: 0,
          fontSize: StyleValues.normal,
          color: AppColors.darkGrey,
        ),
        bodyMedium: GoogleFonts.poppins(
          letterSpacing: 0,
          fontSize: StyleValues.medium,
          color: AppColors.darkGrey,
        ),
        bodyLarge: GoogleFonts.poppins(
          letterSpacing: 0,
          fontSize: StyleValues.large,
          color: AppColors.darkGrey,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkGrey,
        backgroundColor: AppColors.white,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primary,
          ),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData();
  }

  // static ThemeData get getTheme => _appController.darkTheme ? dark : light;
  static ThemeData get getTheme => light;
}
