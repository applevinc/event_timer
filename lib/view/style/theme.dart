import 'package:event_timer/view/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.light_grey,
        accentColor: AppColors.darker_grey,
        primaryColor: AppColors.darker_grey,
        primarySwatch: MaterialColor(
          0xff666666, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          const <int, Color>{
            50: const Color(0xff666666), //10%
            100: const Color(0xff606060), //20%
            200: const Color(0xff5B5B5B), //30%
            300: const Color(0xff555555), //40%
            400: const Color(0xff4F4F4F), //50%
            500: const Color(0xff4A4A4A), //60%
            600: const Color(0xff444444), //70%
            700: const Color(0xff3E3E3E), //80%
            800: const Color(0xff393939), //90%
            900: const Color(0xff333333), //100%
          },
        ),
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.darker_grey,
            selectionHandleColor: AppColors.darker_grey),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.darker_grey,
            brightness: Brightness.dark,
            centerTitle: true),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(shape: RoundedRectangleBorder()),
        textTheme: TextTheme(
            headline4: TextStyle(fontSize: 28.sp),
            headline6: TextStyle(fontSize: 20.sp),
            bodyText2: TextStyle(fontSize: 15.sp)),
        timePickerTheme: TimePickerThemeData(
          backgroundColor: AppColors.light_grey,
          hourMinuteColor: AppColors.dark_grey,
          hourMinuteTextColor: Colors.white,
          dialHandColor: AppColors.dark_grey,
          dayPeriodTextColor: AppColors.dark_grey,
          dayPeriodBorderSide: BorderSide(color: AppColors.dark_grey),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: AppColors.dark_grey,
            focusColor: AppColors.dark_grey,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: AppColors.dark_grey)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: AppColors.dark_grey),
        ));
  }
}
