import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/costants/app_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/widgets/main_buttom.dart';
import 'package:taskati/features/add_task/pages/add_task.dart';
import 'package:taskati/features/home/widgets/task_item.dart';
import 'package:taskati/features/profile/edit_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
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
                        ValueListenableBuilder(
                            valueListenable: LocalHelper.userBox.listenable(),
                            builder: (context, box, child) {
                              String? nameController = box.get(LocalHelper.kName);
                              return Text('Hello, ${nameController}', style: TextStyles.titleStyle(color: AppColors.blueColor, fontSize: 25));
                            }),
                        Text('Have A Nice Day', style: TextStyles.subTitleStyle()),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pushTo(context, EditProfile());
                    },
                    child: ValueListenableBuilder(
                        valueListenable: LocalHelper.userBox.listenable(),
                        builder: (context, box, child) {
                          String? imagePath = box.get(LocalHelper.kImage);
                          return CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.blueColor,
                            backgroundImage: imagePath != null ? FileImage(File(imagePath)) : AssetImage(AppImages.user) as ImageProvider,
                          );
                        }),
                  ),
                ],
              ),
              Gap(30),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()), style: TextStyles.titleStyle(fontSize: 20)),
                      Text('Today', style: TextStyles.titleStyle(fontSize: 20)),
                    ],
                  ),
                  Gap(30),
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
              Gap(20),
              DatePicker(
                width: 70,
                height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.blueColor,
                selectedTextColor: Colors.white,
                dayTextStyle: TextStyles.subTitleStyle(fontSize: 18),
                dateTextStyle: TextStyles.subTitleStyle(fontWeight: FontWeight.w600, fontSize: 18),
                monthTextStyle: TextStyles.subTitleStyle(fontSize: 18),
                onDateChange: (date) {
                  setState(() {
                    selectedDate = DateFormat('dd-MM-yyyy').format(date);
                  });
                },
              ),
              Gap(20),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: LocalHelper.taskBox.listenable(),
                    builder: (context, box, child) {
                      List<TaskModel> tasks = [];
                      for (var task in box.values) {
                        if (task.date == selectedDate) {
                          tasks.add(task);
                        }
                      }
                      if (tasks.isEmpty) {
                        return Column(
                          children: [
                            Lottie.asset(AppImages.empty),
                            Gap(20),
                            Text(
                              'You don\'t have any task yet!\nAdd new tasks to make your day productive.',
                              style: TextStyles.subTitleStyle(),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      }
                      return ListView.separated(
                        itemBuilder: (context, index) => TaskItem(
                          model: tasks[index],
                          onComplete: () {
                            box.put(tasks[index].id, tasks[index].copyWith(isCompleted: true));
                          },
                          onDelete: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog.adaptive(
                                    title: Text(
                                      'Delete Task',
                                      style: TextStyles.titleStyle(color: AppColors.blackColor),
                                    ),
                                    content: Text(
                                      'Are you sure ?',
                                      style: TextStyles.subTitleStyle(color: AppColors.blackColor),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            box.delete(tasks[index].id);
                                            pop(context);
                                          },
                                          child: Text(
                                            'Delete',
                                            style: TextStyles.smallStyle(color: AppColors.blackColor),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.of(context, rootNavigator: true).pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyles.smallStyle(color: AppColors.blackColor),
                                          ))
                                    ],
                                  );
                                });
                          },
                        ),
                        separatorBuilder: (context, index) => SizedBox(height: 10),
                        itemCount: tasks.length,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
