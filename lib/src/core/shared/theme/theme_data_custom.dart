import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';

final themeDataCustom = ThemeData(
  primaryColor: AppColors.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.lightGrey,
  cardColor: AppColors.white,
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(
      // color: AppColors.white,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 20,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.black,
  ),
);
