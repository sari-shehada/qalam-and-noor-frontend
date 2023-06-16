import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
            ? Get.theme.colorScheme.primaryContainer
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
                Text(
                  student.firstName,
                  style: ProjectFonts.titleMedium().copyWith(
                    color: isSelected
                        ? Get.theme.colorScheme.primary
                        : Get.theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                AnimatedOpacity(
                  curve: Curves.fastLinearToSlowEaseIn,
                  opacity: isSelected ? 1 : 0,
                  duration: 300.milliseconds,
                  child: Icon(
                    Icons.check,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
