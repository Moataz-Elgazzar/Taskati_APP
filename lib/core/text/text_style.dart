import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';

class TextStyles {
  static TextStyle titleStyle({
    Color? color,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
      color: color ?? AppColors.blackColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }


  static TextStyle subTitleStyle({
    Color? color,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color ?? AppColors.blackColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }


  static TextStyle smallStyle({
    Color? color,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color ?? AppColors.greyColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
  
}