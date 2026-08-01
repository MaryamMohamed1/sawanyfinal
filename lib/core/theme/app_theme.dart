import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.lightBackground,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,

      primary: AppColors.primary,

      secondary: AppColors.accent,

      surface: AppColors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,

      foregroundColor: AppColors.primary,

      elevation: 0,

      centerTitle: false,
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,

      fillColor: AppColors.white,

      hintStyle: TextStyle(color: AppColors.gray, fontSize: 12),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),

        borderSide: BorderSide.none,
      ),
    ),
  );
}
