import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';

abstract class MyThemeData{
  static  ThemeData darkTheme= ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor
  );
}