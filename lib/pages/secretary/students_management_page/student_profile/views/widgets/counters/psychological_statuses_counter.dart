import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../../../controllers/student_profile_controller.dart';
import '../dialogs/psychological_statuses_dialog.dart';

class PsychologicalStatusesCounter extends GetView<StudentProfileController> {
  const PsychologicalStatusesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if (controller.studentPsychologicalStatus.isEmpty)
          {
            SnackBarService.showNeutralSnackBar(
                title: "الطالب ليس لديه حالات اجتماعية",
                message: "المرشد النفسي لم يفحص الطالب بعد")
          }
        else
          {
            Get.dialog(
              (PsychologicalInfoDialog(
                list: controller.studentPsychologicalStatus,
              )),
            ),
          }
      },
      child: Container(
        padding: EdgeInsets.all(15.w),
        height: 80.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: GlobalStyles.miscColors.elementAt(2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Text(
              "عدد الحالات الإجتماعية",
              style: ProjectFonts.headlineSmall().copyWith(color: Colors.white),
            ),
            AddHorizontalSpacing(value: 15.w),
            Text(
              controller.studentPsychologicalStatus.length.toString(),
              style: ProjectFonts.headlineSmall().copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
