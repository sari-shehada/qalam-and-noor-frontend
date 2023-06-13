import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../tools/ui_tools/loader_widget.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../account_settings_page/views/widgets/profile_info_widget.dart';
import '../../controllers/student_profile_controller.dart';

class MainInfo extends GetView<StudentProfileController> {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      margin: EdgeInsets.all(10.w),
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.w, bottom: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
              future: controller.getStudentGender(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.r),
                    ),
                    child: const LoaderWidget(),
                  );
                } else {
                  if (snapshot.data == Icons.male) {
                    return Container(
                      height: 50.h,
                      width: 140.w,
                      padding: EdgeInsets.only(
                          left: 10.w, bottom: 5.h, right: 5.w, top: 5.h),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        children: [
                          Icon(snapshot.data, color: Colors.white, size: 35.sp),
                          AddHorizontalSpacing(value: 15.w),
                          Text(
                            "ذكر",
                            style: ProjectFonts.headlineSmall()
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container(
                    height: 50.h,
                    width: 140.w,
                    padding: EdgeInsets.only(
                        left: 10.w, bottom: 5.h, right: 5.w, top: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.pink[300],
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          snapshot.data,
                          color: Colors.white,
                          size: 35.sp,
                        ),
                        AddHorizontalSpacing(value: 25.w),
                        Text(
                          "انثى",
                          style: ProjectFonts.headlineSmall()
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }
              }),
          AddVerticalSpacing(value: 15.h),
          IconLabelItem(
            iconData: FontAwesomeIcons.cakeCandles,
            label: DateTimeHelper.getDateWithoutTime(
              controller.student.value.dateOfBirth,
            ),
            toolTip: "تاريخ الميلاد",
          ),
          AddVerticalSpacing(value: 15.h),
          IconLabelItem(
            iconData: FontAwesomeIcons.phoneFlip,
            label: controller.student.value.landLine,
            toolTip: "رقم الهاتف الأرضي",
          ),
          AddVerticalSpacing(value: 15.h),
          IconLabelItem(
            iconData: FontAwesomeIcons.whatsapp,
            label: controller.student.value.whatsappPhoneNumber,
          ),
        ],
      ),
    );
  }
}
