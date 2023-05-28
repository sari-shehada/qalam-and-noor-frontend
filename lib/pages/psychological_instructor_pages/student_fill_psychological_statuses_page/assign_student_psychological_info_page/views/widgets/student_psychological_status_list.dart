import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/student_fill_psychological_statuses_page/assign_student_psychological_info_page/controllers/assign_student_psychological_info_controller.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/student_fill_psychological_statuses_page/assign_student_psychological_info_page/views/widgets/student_psychological_status_card.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class StudentPsychologicalStatusList
    extends GetView<AssignStudentPsychologicalInfoController> {
  const StudentPsychologicalStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Container(
            height: 70.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            decoration: BoxDecoration(
              color: Get.theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10.h),
                  color: Get.theme.colorScheme.shadow.withOpacity(.09),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  'قم باختيار الحالة الاجتماعية بالضغط على الزر المرافق ثم ملء المعلومات المتعلقة',
                  style: ProjectFonts.headlineSmall(),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                  child: Row(
                    children: [
                      Text(
                        'الإجرائات',
                        style: ProjectFonts.bodyLarge().copyWith(
                          color: Colors.white,
                        ),
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      IconButton(
                        tooltip: 'إعادة تعيين',
                        onPressed: () => controller.addedStatuses.clear(),
                        hoverColor: Colors.white.withOpacity(.3),
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: controller.psychologicalStatuses.length,
              itemBuilder: (context, index) {
                List<Color> backgroundColors = [
                  Colors.transparent,
                  Colors.white,
                ];
                return StudentPsychologicalStatusCard(
                  psychologicalStatus: controller.psychologicalStatuses[index],
                  backgroundColor: backgroundColors[index % 2],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
