import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/widgets/label_Text.dart';
import 'package:taskati/core/widgets/main_buttom.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var starttimecontroller = TextEditingController();
  var endtimecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blueColor),
          onPressed: () {
            pop(context);
          },
        ),
        title: Text('Add Task', style: TextStyles.titleStyle(color: AppColors.blueColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                LabelText(
                  controller: titlecontroller,
                  hint: 'Enter Title',
                  title: 'Title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Title';
                    }
                    return null;
                  },
                ),
                Gap(10),
                LabelText(
                  controller: descriptioncontroller,
                  hint: 'Enter Description',
                  title: 'Description',
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                ),
                Gap(10),
                LabelText(
                  controller: datecontroller,
                  hint: '17-5-2025',
                  title: 'Date',
                  suffix: Icon(Icons.calendar_month, color: AppColors.blueColor),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Date';
                    }
                    return null;
                  },
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: LabelText(
                        controller: starttimecontroller,
                        hint: '09:08 PM',
                        title: 'Start Time',
                        suffix: Icon(Icons.access_time_outlined, color: AppColors.blueColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Time';
                          }
                          return null;
                        },
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: LabelText(
                        controller: endtimecontroller,
                        hint: '09:08 PM',
                        title: 'End Time',
                        suffix: Icon(Icons.access_time_outlined, color: AppColors.blueColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Time';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Color', style: TextStyles.titleStyle()),
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.circle, color: AppColors.blueColor, size: 50),
                        ),
                        Positioned(top: 15, right: 15, left: 15, child: Icon(Icons.check, color: AppColors.wightColor, size: 30)),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle, color: AppColors.orangeColor, size: 50),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle, color: AppColors.redColor, size: 50),
                    ),
                  ],
                ),
                Gap(40),
                MainButtom(
                  text: 'Creat Task',
                  onPressed: () {
                    if (formkey.currentState!.validate()) {}
                  },
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
