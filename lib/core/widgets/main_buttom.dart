import 'package:flutter/material.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';

class MainButtom extends StatelessWidget {
  const MainButtom({super.key, required this.text, this.width = 250, this.height = 55, required this.onPressed});

  final String text;
  final double width;
  final double height;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(text, style: TextStyles.subTitleStyle(color: AppColors.wightColor)),
      ),
    );
  }
}
