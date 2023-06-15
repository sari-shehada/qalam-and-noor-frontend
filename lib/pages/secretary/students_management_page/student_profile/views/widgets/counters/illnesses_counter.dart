import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import '../../../controllers/student_profile_controller.dart';
import '../../../../../../../configs/fonts.dart';
import '../dialogs/illnesses_information_dialog.dart';

class IllnessesCounter extends GetView<StudentProfileController> {
  const IllnessesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    // final Color colorOfChoice = GlobalStyles.getMiscColor(2);
    final Color colorOfChoice = Theme.of(context).colorScheme.primary;
    return Obx(() {
      if (controller.isLoading.value) {
        return const SizedBox.shrink();
      }
      return InkWell(
        onTap: () async {
          if (controller.studentIllnessInfo.isEmpty) {
            SnackBarService.showNeutralSnackBar(
                title: 'لا يعاني الطالب من امراض',
                message: 'الطالب في حالة صحية تامة');
            return;
          }
          await Get.dialog(
            IllnessesInfoDialog(
              list: controller.studentIllnessInfo,
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
                  controller.studentIllnessInfo.length.toString(),
                  style: ProjectFonts.headlineSmall().copyWith(
                    fontSize: 40.sp,
                    color: colorOfChoice,
                  ),
                ),
                Text(
                  "مرض",
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
    });
  }
}
