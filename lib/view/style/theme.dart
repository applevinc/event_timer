import 'package:event_timer/view/style/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData defaultTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.lightGrey,
      accentColor: AppColors.darkerGrey,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkerGrey,
        brightness: Brightness.dark,
      ),
    );
  }
}
