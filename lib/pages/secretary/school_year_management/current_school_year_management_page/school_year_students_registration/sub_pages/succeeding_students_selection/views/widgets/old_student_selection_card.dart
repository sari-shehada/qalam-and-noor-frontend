import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import '../../../../../../../../../configs/fonts.dart';
import '../../../../../../../../../models/agendas/student.dart';

class OldStudentSelectionCard extends StatelessWidget {
  const OldStudentSelectionCard({
    super.key,
    required this.student,
    required this.isSelected,
    required this.toggleCallBack,
    required this.backgroundColor,
  });

  final Student student;
  final bool isSelected;
  final VoidCallback toggleCallBack;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        color: isSelected
            ? student.isMale
                ? Get.theme.colorScheme.primaryContainer
                : Colors.pink.shade50
            : backgroundColor,
      ),
      duration: 500.milliseconds,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: toggleCallBack,
          child: AnimatedPadding(
            duration: 500.milliseconds,
            curve: Curves.fastLinearToSlowEaseIn,
            padding: EdgeInsets.only(
              top: 25.h,
              bottom: 25.h,
              right: isSelected ? 25.w : 15.w,
              left: 25.w,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    student.publicRecordId.toString(),
                    style: ProjectFonts.titleMedium().copyWith(
                      color: foregroundColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    student.firstName,
                    style: ProjectFonts.titleMedium().copyWith(
                      color: foregroundColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        student.isMale ? Icons.male : Icons.female,
                        color: foregroundColor,
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      Text(
                        student.isMale ? 'ذكر' : 'أنثى',
                        style: ProjectFonts.titleMedium().copyWith(
                          color: foregroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text(
                        student.getAge().toString(),
                        style: ProjectFonts.titleMedium().copyWith(
                          color: foregroundColor,
                        ),
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      Text(
                        'سنوات',
                        style: ProjectFonts.titleMedium().copyWith(
                          color: foregroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AnimatedOpacity(
                    curve: Curves.fastLinearToSlowEaseIn,
                    opacity: isSelected ? 1 : 0,
                    duration: 300.milliseconds,
                    child: Icon(
                      Icons.check,
                      color: student.isMale
                          ? Get.theme.colorScheme.primary
                          : Colors.pink.shade300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get foregroundColor => isSelected
      ? student.isMale
          ? Get.theme.colorScheme.primary
          : Colors.pink.shade300
      : Get.theme.colorScheme.onSurfaceVariant;
}
