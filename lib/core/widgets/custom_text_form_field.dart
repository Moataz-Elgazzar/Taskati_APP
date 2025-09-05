import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hint, required this.controller, this.suffix, this.maxLines = 1, this.validator, this.readOnly = false, this.onTap});

  final String? hint;
  final TextEditingController controller;
  final Widget? suffix;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ,
      readOnly: readOnly ,
      validator: validator,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(hintText: hint, suffixIcon: suffix),
    );
  }
}
