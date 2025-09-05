import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/costants/app_images.dart';
import 'package:taskati/core/functions/dialogs.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/main_buttom.dart';
import 'package:taskati/features/home/pages/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String imagePath = '';
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (imagePath.isNotEmpty && nameController.text.isNotEmpty) {
                LocalHelper.putUserData(nameController.text, imagePath);
                pushWithReplacement(context, HomeScreen());
              } else if (imagePath.isNotEmpty && nameController.text.isEmpty) {
                showErrorDialog(context, 'Please Enter Your Name');
              } else if (imagePath.isEmpty && nameController.text.isNotEmpty) {
                showErrorDialog(context, 'Please Enter Your Photo');
              } else {
                showErrorDialog(context, 'Please Enter Your Name & Photo');
              }
            },
            child: Text('Done', style: TextStyles.subTitleStyle(color: AppColors.blueColor)),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 90, backgroundColor: AppColors.wightColor, backgroundImage: imagePath.isNotEmpty ? FileImage(File(imagePath)) : AssetImage(AppImages.user)),
                Gap(20),
                MainButtom(
                  text: 'Upload From Camera',
                  onPressed: () async {
                    await uploadImage(isCamera: true);
                  },
                ),
                Gap(20),
                MainButtom(
                  text: 'Upload From Gallery',
                  onPressed: () async {
                    await uploadImage(isCamera: false);
                  },
                ),
                Gap(20),
                Divider(thickness: 1, color: AppColors.greyColor),
                Gap(20),
                CustomTextFormField(hint: 'Enter your name', controller: nameController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage({required bool isCamera}) async {
    XFile? file = await ImagePicker().pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      if (file != null) {
        imagePath = file.path;
      }
    });
  }
}
