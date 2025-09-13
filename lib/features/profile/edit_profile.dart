import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/costants/app_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/main_buttom.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String imagePath = '';
  var nameController = TextEditingController();
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
        actions: [
          IconButton(
            icon: Icon(Icons.sunny, color: AppColors.blueColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(color: AppColors.wightColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    MainButtom(
                                      width: double.infinity,
                                      text: 'Update From Camera',
                                      onPressed: () async {
                                        await uploadImage(isCamera: true);
                                        LocalHelper.putData(LocalHelper.kImage, imagePath);
                                        pop(context);
                                      },
                                    ),
                                    Gap(20),
                                    MainButtom(
                                      width: double.infinity,
                                      text: 'Update From Gallery',
                                      onPressed: () async {
                                        await uploadImage(isCamera: false);
                                        LocalHelper.putData(LocalHelper.kImage, imagePath);
                                        pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: AppColors.wightColor,
                    backgroundImage: LocalHelper.getData(LocalHelper.kImage) != null ? FileImage(File(LocalHelper.getData(LocalHelper.kImage))) : AssetImage(AppImages.user) as ImageProvider<Object>,
                  ),
                ),
                Positioned(
                    top: 152,
                    right: 20,
                    child: Icon(
                      Icons.add_circle,
                      color: AppColors.blueColor,
                      size: 30,
                    ))
              ]),
            ),
            Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    LocalHelper.getData(LocalHelper.kName),
                    style: TextStyles.titleStyle(color: AppColors.blueColor, fontSize: 24),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(color: AppColors.wightColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      CustomTextFormField(hint: 'Enter your name', controller: nameController),
                                      Gap(20),
                                      MainButtom(
                                        width: double.infinity,
                                        text: 'Update Your Name',
                                        onPressed: () async {
                                          await LocalHelper.putData(LocalHelper.kName, nameController.text);
                                          setState(() {});
                                          pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )));
                    },
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.blueColor,
                      size: 30,
                    ))
              ],
            )
          ],
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
