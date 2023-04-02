import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui_tools.dart';

class HintedTextField extends StatelessWidget {
  const HintedTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.textColor = Colors.black, //TODO: Change later
    this.hintColor = Colors.grey, //TODO: Change later
    this.inputFormatters,
  });

  final String hintText;
  final TextEditingController controller;
  final TextAlign textAlign;
  final Color? fillColor;
  final Color hintColor;
  final Color textColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: inputFormatters,
      style: TextStyle(
        fontSize: 22.sp,
        color: textColor,
      ),
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        // counterText: containsLetterCount ? null : '',
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 22.sp,
          color: hintColor,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18.h),
        isDense: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 2.w),
          borderRadius: BorderRadius.circular(14.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14.r),
        ),
        filled: true,
        //TODO: Change based on seed color
        fillColor: fillColor ?? const Color(0xFFE3E3E3),
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  const LabeledTextField(
      {super.key,
      required this.textEditingController,
      required this.label,
      this.titleColor,
      this.fillColor});

  final String label;
  final Color? titleColor;
  final TextEditingController textEditingController;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AddHorizontalSpacing(value: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
          ],
        ),
        AddVerticalSpacing(value: 12.h),
        HintedTextField(
          controller: textEditingController,
          hintText: '',
          fillColor: fillColor,
        )
      ],
    );
  }
}
