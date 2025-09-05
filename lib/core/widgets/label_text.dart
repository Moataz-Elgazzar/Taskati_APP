import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.controller, required this.hint, required this.title, this.suffix, this.maxLines = 1, this.validator, this.readOnly = false, this.onTap});

  final TextEditingController controller;
  final String hint;
  final String title;
  final Widget? suffix;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.titleStyle()),
        Gap(10),
        CustomTextFormField(controller: controller, hint: hint, suffix: suffix, maxLines: maxLines, validator: validator, readOnly: readOnly, onTap: onTap),
      ],
    );
  }
}
