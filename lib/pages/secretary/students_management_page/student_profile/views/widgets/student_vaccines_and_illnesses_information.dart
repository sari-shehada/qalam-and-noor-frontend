import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../../shared/account_settings_page/views/widgets/profile_info_widget.dart';
import '../../controllers/student_profile_controller.dart';

class MedicalRecordInfo extends GetView<StudentProfileController> {
  const MedicalRecordInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      width: 280.w,
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.w, bottom: 10.w),
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20.h),
            blurRadius: 12,
            color: colorScheme.primary.withOpacity(.09),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.fileMedical,
            color: colorScheme.primary,
            size: 50.sp,
          ),
          Container(
            height: 100.h,
            width: 1.w,
            margin: EdgeInsets.only(left: 15.w, right: 15.w),
            decoration: BoxDecoration(color: colorScheme.primary),
          ),
          FutureBuilder(
            future: controller.getMedicalRecord(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  child: const LoaderWidget(),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconLabelItem(
                    iconData: Icons.height_outlined,
                    label: snapshot.data!.studentHight.toString(),
                    toolTip: "طول الطالب",
                  ),
                  AddVerticalSpacing(value: 15.h),
                  IconLabelItem(
                    iconData: Icons.monitor_weight,
                    label: "Kg  ${snapshot.data!.studentWeight}",
                    toolTip: "وزن الطالب",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
