import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/models/medical/psychological_status.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/student_fill_psychological_statuses_page/assign_student_psychological_info_page/controllers/assign_student_psychological_info_controller.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../../configs/fonts.dart';

class StudentPsychologicalStatusCard
    extends GetView<AssignStudentPsychologicalInfoController> {
  const StudentPsychologicalStatusCard({
    super.key,
    required this.psychologicalStatus,
    required this.backgroundColor,
  });

  final PsychologicalStatus psychologicalStatus;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Get.theme.colorScheme;

    return Obx(
      () {
        final bool isSelected =
            controller.addedStatuses.keys.contains(psychologicalStatus);
        return AnimatedContainer(
          duration: 300.milliseconds,
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primaryContainer.withOpacity(.4)
                : backgroundColor,
          ),
          height: 76.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isSelected,
                          onChanged: (value) =>
                              controller.addOrRemoveStatus(psychologicalStatus),
                        ),
                        AddHorizontalSpacing(value: 35.w),
                        Text(
                          psychologicalStatus.name,
                          style: ProjectFonts.titleLarge().copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        AddHorizontalSpacing(value: 30.w),
                      ],
                    ),
                    AnimatedOpacity(
                      opacity: isSelected ? 1 : 0,
                      duration: 300.milliseconds,
                      child: Row(
                        children: [
                          Text(
                            'ملاحظات (اختياري)',
                            style: ProjectFonts.titleMedium(),
                          ),
                          AddHorizontalSpacing(value: 20.w),
                          SizedBox(
                            width: 300.w,
                            child: AbsorbPointer(
                              absorbing: isSelected ? false : true,
                              child: HintedTextField(
                                hintText: '',
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 12.h),
                                controller: TextEditingController(),
                                fillColor: Colors.white.withOpacity(.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: 300.milliseconds,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'درجة الحالة',
                        style: ProjectFonts.titleMedium(),
                      ),
                      SizedBox(
                        width: 550.w,
                        child: Obx(
                          () {
                            final int value = (controller
                                        .addedStatuses[psychologicalStatus]
                                        ?.statusLevel
                                        .index ??
                                    2) +
                                1;
                            return AbsorbPointer(
                              absorbing: isSelected ? false : true,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Slider(
                                      min: 1,
                                      max: 5,
                                      activeColor:
                                          Get.theme.colorScheme.primary,
                                      value: value.toDouble(),
                                      onChanged: (val) =>
                                          controller.changeStatusLevel(
                                        psychologicalStatus,
                                        val.toInt() - 1,
                                      ),
                                    ),
                                  ),
                                  AddHorizontalSpacing(value: 30.w),
                                  Container(
                                    width: 120.w,
                                    alignment: Alignment.center,
                                    child: Text(
                                      psychologicalStatusLevelAsString[
                                              PsychologicalStatusLevel.values[
                                                  (value - 1).toInt()]] ??
                                          '',
                                      style: ProjectFonts.titleLarge().copyWith(
                                        color: psychologicalStatusLevelAsColor[
                                            PsychologicalStatusLevel
                                                .values[(value - 1).toInt()]],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
