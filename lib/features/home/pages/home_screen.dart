import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/costants/app_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/widgets/main_buttom.dart';
import 'package:taskati/features/add_task/pages/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, ${LocalHelper.getData(LocalHelper.kName)}', style: TextStyles.titleStyle(color: AppColors.blueColor, fontSize: 25)),
                        Text('Have A Nice Day', style: TextStyles.subTitleStyle(color: AppColors.blackColor)),
                      ],
                    ),
                  ),
                  CircleAvatar(radius: 30, backgroundColor: AppColors.blueColor, backgroundImage: LocalHelper.getData(LocalHelper.kImage) != null ? FileImage(File(LocalHelper.getData(LocalHelper.kImage))) : AssetImage(AppImages.user)),
                ],
              ),
              Gap(30),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()), style: TextStyles.titleStyle(color: AppColors.blackColor, fontSize: 20)),
                      Text('Today', style: TextStyles.titleStyle(color: AppColors.blackColor, fontSize: 20)),
                    ],
                  ),
                  Gap(40),
                  Expanded(
                    child: MainButtom(
                      text: '+ Add Task',
                      onPressed: () {
                        pushTo(context, AddTaskScreen());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
