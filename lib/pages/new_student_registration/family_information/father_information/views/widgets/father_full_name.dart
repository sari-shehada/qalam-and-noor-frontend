import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

class FatherFullName extends StatelessWidget {
  const FatherFullName({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.grandFatherController,
    required this.grandMotherController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController grandFatherController;
  final TextEditingController grandMotherController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      height: 260.h,
      width: 600.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(children: [
        Text(
          "إسم الأب الكامل",
          style: ProjectFonts.titleLarge,
        ),
        AddVerticalSpacing(value: 20.h),
        Row(
          children: [
            SizedBox(
              width: 270.w,
              child: HintedTextField(
                hintText: "الإسم الأول",
                controller: firstNameController,
                inputFormatters: [FilteringTextInputFormatter.allow("[ا-ي]")],
              ),
            ),
            AddHorizontalSpacing(value: 20.w),
            SizedBox(
              width: 270.w,
              child: HintedTextField(
                controller: lastNameController,
                hintText: "اللقب",
                inputFormatters: [FilteringTextInputFormatter.allow("[ا-ي]")],
              ),
            ),
          ],
        ),
        AddVerticalSpacing(value: 20.h),
        Row(
          children: [
            SizedBox(
              width: 270.w,
              child: HintedTextField(
                controller: grandFatherController,
                hintText: "إسم الأب",
                inputFormatters: [FilteringTextInputFormatter.allow("[ا-ي]")],
              ),
            ),
            AddHorizontalSpacing(value: 20.w),
            SizedBox(
              width: 270.w,
              child: HintedTextField(
                controller: grandMotherController,
                hintText: "إسم الأم",
                inputFormatters: [FilteringTextInputFormatter.allow("[ا-ي]")],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
