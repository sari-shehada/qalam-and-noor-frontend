import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/student_profile_controller.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../dialogs/illnesses_information_dialog.dart';

class IllnessesCounter extends GetView<StudentProfileController> {
  const IllnessesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.dialog((IllnessesInfoDialog(
        list: controller.studentIllnessInfo,
      ))),
      child: Container(
        padding: EdgeInsets.all(15.w),
        height: 80.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: GlobalStyles.miscColors.elementAt(3),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Text(
              "عدد الأمراض",
              style: ProjectFonts.headlineSmall().copyWith(color: Colors.white),
            ),
            AddHorizontalSpacing(value: 15.w),
            Text(
              controller.studentIllnessInfo.length.toString(),
              style: ProjectFonts.headlineSmall().copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}