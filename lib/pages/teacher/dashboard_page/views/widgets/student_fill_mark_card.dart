import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../models/agendas/student.dart';
import '../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class StudentFillMarkCard extends StatelessWidget {
  const StudentFillMarkCard({
    super.key,
    required this.student,
    required this.backgroundColor,
  });
  final Student student;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    TextEditingController markController = TextEditingController();
    Rx<bool> isHovered = false.obs;
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onHover: (value) => isHovered.value = value,
          child: Obx(
            () => AnimatedPadding(
              duration: 150.milliseconds,
              padding: isHovered.value
                  ? EdgeInsets.symmetric(horizontal: 40.w)
                  : EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      student.publicRecordId.toString(),
                      style: ProjectFonts.titleLarge().copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      student.firstName,
                      style: ProjectFonts.titleLarge().copyWith(
                        fontWeight: FontWeight.normal,
                        color: Get.theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          student.isMale ? Icons.male : Icons.female,
                          color: student.isMale
                              ? Get.theme.colorScheme.primary
                              : Colors.pink[300],
                          size: 30.sp,
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        Text(
                          student.isMale ? 'ذكر' : 'أنثى',
                          style: ProjectFonts.titleMedium(),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: HintedTextField(inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ], hintText: "العلامة", controller: markController),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
