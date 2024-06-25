import 'package:flutter/material.dart';
import 'package:matchup/core/constants/app_colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "satoshi",
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        background: Color(0xFF1A1617),
        primary: Color(0xFFFE6008),
        secondary: AppColors.textSecondaryDark,
        inversePrimary: AppColors.textPrimaryDark,
        inverseSurface: Color(0xff282828)),
    textTheme: ThemeData.light().textTheme.apply(
        bodyColor: AppColors.textPrimaryDark, displayColor: Colors.black),
  );
}
