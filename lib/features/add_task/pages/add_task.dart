import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
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
  var datecontroller = TextEditingController(text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  var starttimecontroller = TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  var endtimecontroller = TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))));
  var formkey = GlobalKey<FormState>();
  List<Color> colors = [AppColors.blueColor, AppColors.orangeColor, AppColors.redColor];
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
                LabelText(
                  controller: descriptioncontroller,
                  hint: 'Enter Description',
                  title: 'Description',
                  maxLines: 3,
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
