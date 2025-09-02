import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';

showErrorDialog (BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: AppColors.blackColor,
                    behavior: SnackBarBehavior.floating,
                    elevation: 0,
                    duration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  ),
                );
}