import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/student_profile/controllers/student_profile_controller.dart';
import 'package:kalam_noor/pages/student_profile/views/widgets/dialogs/vaccines_information_dialog.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../configs/styles.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class VaccinesCounter extends GetView<StudentProfileController> {
  const VaccinesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getAllStudentTakenVaccines(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            padding: EdgeInsets.all(15.w),
            height: 80.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: GlobalStyles.miscColors.elementAt(0),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Text(
                  "عدد اللقاحات",
                  style: ProjectFonts.headlineSmall()
                      .copyWith(color: Colors.white),
                ),
                AddHorizontalSpacing(value: 15.w),
                Text(
                  "...",
                  style: ProjectFonts.headlineSmall()
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return const ErrorLoadingSomethingWidget(somethingName: "اللقاحات");
        }
        return InkWell(
          onTap: () => Get.dialog(
            (VaccinesInfoDialog(
              list: snapshot.data!,
            )),
          ),
          child: Container(
            padding: EdgeInsets.all(15.w),
            height: 80.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: GlobalStyles.miscColors.elementAt(0),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Text(
                  "عدد اللقاحات",
                  style: ProjectFonts.headlineSmall()
                      .copyWith(color: Colors.white),
                ),
                AddHorizontalSpacing(value: 15.w),
                Text(
                  snapshot.data!.length.toString(),
                  style: ProjectFonts.headlineSmall()
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
