import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/costants/app_fonts.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/splash/pages/splash.dart';

Future<void> main() async{
  await Hive.initFlutter();
  await LocalHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.wightColor,
        appBarTheme: AppBarTheme(color: AppColors.wightColor, centerTitle: true, surfaceTintColor: Colors.transparent, elevation: 0),
        fontFamily: AppFonts.poppins,
        inputDecorationTheme: InputDecorationTheme(
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
      ),
    );
  }
}
