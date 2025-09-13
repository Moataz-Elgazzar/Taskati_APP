import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/costants/color_task.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/widgets/label_Text.dart';
import 'package:taskati/core/widgets/main_buttom.dart';
import 'package:taskati/features/home/pages/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var datecontroller = TextEditingController(text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  var starttimecontroller = TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  var endtimecontroller = TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))));
  var formkey = GlobalKey<FormState>();
  
  int currentIndex = 0;

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
                LabelText(controller: descriptioncontroller, hint: 'Enter Description', title: 'Description', maxLines: 3),
                Gap(10),
                LabelText(
                  controller: datecontroller,
                  hint: 'Enter Date',
                  title: 'Date',
                  onTap: () async {
                    var selectedDate = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2050), initialDate: DateTime.now());
                    if (selectedDate != null) {
                      datecontroller.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                    }
                  },
                  readOnly: true,
                  suffix: Icon(Icons.calendar_month, color: AppColors.blueColor),
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: LabelText(
                        onTap: () async {
                          var selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                          if (selectedTime != null) {
                            starttimecontroller.text = selectedTime.format(context);
                          }
                        },
                        readOnly: true,
                        controller: starttimecontroller,
                        hint: 'Enter Time',
                        title: 'Start Time',
                        suffix: Icon(Icons.access_time_outlined, color: AppColors.blueColor),
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: LabelText(
                        onTap: () async {
                          var selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                          if (selectedTime != null) {
                            endtimecontroller.text = selectedTime.format(context);
                          }
                        },
                        readOnly: true,
                        controller: endtimecontroller,
                        hint: 'Enter Time',
                        title: 'End Time',
                        suffix: Icon(Icons.access_time_outlined, color: AppColors.blueColor),
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
                  spacing: 5,
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: colors[index],
                        child: currentIndex == index ? Icon(Icons.check, color: AppColors.wightColor) : null,
                      ),
                    );
                  }),
                ),
                Gap(40),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: MainButtom(
                    text: 'Creat Task',
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        String id = titlecontroller.text + datecontroller.text + endtimecontroller.text;
                        await LocalHelper.putTask(
                            id,
                            TaskModel(
                              id: id,
                              title: titlecontroller.text,
                              description: descriptioncontroller.text,
                              date: datecontroller.text,
                              startTime: starttimecontroller.text,
                              endTime: endtimecontroller.text,
                              color: currentIndex,
                              isCompleted: false,
                            ));
                        pushAndRemoveUntil(context, HomeScreen());
                      }
                    },
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
