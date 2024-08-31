import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/app_colors.dart';

abstract class MyThemeData {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.grayColor,
      type: BottomNavigationBarType.shifting,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      color: AppColors.primaryColor
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
        fontSize: 25
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
        fontSize: 16
      ),
      bodySmall: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        color: AppColors.grayColor,
        fontSize: 14
      ),
    ),
  );

}