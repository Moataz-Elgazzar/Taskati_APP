import 'package:flutter/material.dart';
import 'package:taskati/core/costants/app_fonts.dart';
import 'package:taskati/core/utils/color.dart';

class AppTheme {
  static get lighttheme => ThemeData(
        scaffoldBackgroundColor: AppColors.wightColor,
        appBarTheme: AppBarTheme(color: AppColors.wightColor, centerTitle: true, surfaceTintColor: Colors.transparent, elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueColor, onSurface: AppColors.blackColor),
        fontFamily: AppFonts.poppins,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.greyColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
        ),
      );

  static get darktheme => ThemeData(
        scaffoldBackgroundColor: AppColors.blackColor,
        appBarTheme: AppBarTheme(color: AppColors.blackColor, centerTitle: true, surfaceTintColor: Colors.transparent, elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueColor, onSurface: AppColors.wightColor),
        fontFamily: AppFonts.poppins,
        datePickerTheme: DatePickerThemeData(backgroundColor: AppColors.blackColor, headerForegroundColor: AppColors.greyColor),
        timePickerTheme: TimePickerThemeData(backgroundColor: AppColors.blackColor, dialBackgroundColor: AppColors.blackColor, hourMinuteColor: AppColors.greyColor, hourMinuteTextColor: AppColors.wightColor, dayPeriodTextColor: const Color.fromARGB(255, 130, 115, 115)),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.greyColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
        ),
      );
}
