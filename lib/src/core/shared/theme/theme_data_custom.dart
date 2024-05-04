import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';

final themeDataCustom = ThemeData(
  primaryColor: AppColors.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.lightGrey,
  cardColor: AppColors.white,
  textTheme: TextTheme(
    titleSmall: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.medium,
    ),
    titleMedium: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.large,
    ),
    titleLarge: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.extraLarge,
    ),
    displaySmall: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.normal,
    ),
    displayMedium: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.medium,
    ),
    displayLarge: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.large,
    ),
    bodySmall: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.normal,
    ),
    bodyMedium: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.medium,
    ),
    bodyLarge: GoogleFonts.poppins(
      letterSpacing: 0,
      fontSize: StyleValues.large,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 1,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.primaryColorText,
  ),
);
