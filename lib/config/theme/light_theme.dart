import 'package:flutter/material.dart';
import 'package:matchup/core/constants/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Multi",
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        background: Color.fromRGBO(255, 255, 255, 1),
        primary: AppColors.primary,
        secondary: AppColors.textSecondaryDark,
        inversePrimary: AppColors.textPrimaryLight,
        inverseSurface: Color(0xffD9D9D9)),
    textTheme: ThemeData.light().textTheme.apply(
        bodyColor: AppColors.textPrimaryDark, displayColor: Colors.black),
  );
}
