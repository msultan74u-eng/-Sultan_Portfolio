import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightPrimary,
      onPrimary: Colors.white,
      secondary: AppColors.lightPrimary,
      onSecondary: Colors.white,
      background: AppColors.lightBackground,
      onBackground: AppColors.lightTextPrimary,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightTextPrimary,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimary,
      onPrimary: Colors.black,
      secondary: AppColors.darkPrimary,
      onSecondary: Colors.black,
      background: AppColors.darkBackground,
      onBackground: AppColors.darkTextPrimary,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      error: Colors.red,
      onError: Colors.black,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
  );
}