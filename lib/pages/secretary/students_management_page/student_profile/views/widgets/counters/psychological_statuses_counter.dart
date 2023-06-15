import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../controllers/student_profile_controller.dart';
import '../dialogs/psychological_statuses_dialog.dart';

class PsychologicalStatusesCounter extends GetView<StudentProfileController> {
  const PsychologicalStatusesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final Color colorOfChoice = Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: () async {
        if (controller.studentPsychologicalStatus.isEmpty) {
          SnackBarService.showNeutralSnackBar(
              title: "الطالب ليس لديه حالات اجتماعية",
              message: "المرشد النفسي لم يفحص الطالب بعد");
          return;
        }
        await Get.dialog(
          PsychologicalInfoDialog(
            list: controller.studentPsychologicalStatus,
          ),
        );
      },
      child: SizedBox(
        width: 200.w,
        height: 200.w,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: colorOfChoice,
                style: BorderStyle.solid,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  offset: const Offset(1, 0),
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.studentPsychologicalStatus.length.toString(),
                style: ProjectFonts.headlineSmall().copyWith(
                  fontSize: 40.sp,
                  color: colorOfChoice,
                ),
              ),
              Text(
                "حالة إجتماعية",
                textAlign: TextAlign.center,
                style: ProjectFonts.headlineSmall().copyWith(
                  fontSize: 30.sp,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
