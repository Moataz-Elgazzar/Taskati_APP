import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hint, required this.controller, this.suffix, this.maxLines, this.minLines, this.keyboardType, this.validator});
  
  
  final String? hint;
  final TextEditingController controller;
  final Widget? suffix;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(hintText: hint, suffixIcon: suffix),
    );
  }
}
