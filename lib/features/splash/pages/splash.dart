import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/costants/app_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/home/pages/home_screen.dart';
import 'package:taskati/features/upload/pages/upload.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _clearOldTask() {
    final box = LocalHelper.taskBox;
    final today = DateFormat('dd-MM-yyyy').format(DateTime.now());

    final keyToDelete = <dynamic>[];

    for (var task in box.values) {
      if ((task.date?.compareTo(today) ?? 1) < 0) {
        keyToDelete.add(task.id);
      }
    }

    for (var key in keyToDelete) {
      box.delete(key);
    }
  }

  @override
  void initState() {
    super.initState();
    _clearOldTask();
    bool isUploaded = LocalHelper.getData(LocalHelper.kIsUploaded) ?? false;
    Future.delayed(Duration(seconds: 3), () {
      (isUploaded) ? pushWithReplacement(context, HomeScreen()) : pushWithReplacement(context, UploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset(AppImages.logo, width: 300)),
          Gap(20),
          Text('Taskati', style: TextStyles.titleStyle(fontSize: 30)),
          Gap(20),
          Text('It\'s Time to Get Organized', style: TextStyles.subTitleStyle(fontSize: 20, color: AppColors.greyColor)),
        ],
      ),
    );
  }
}
