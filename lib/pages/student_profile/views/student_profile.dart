import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../configs/fonts.dart';
import '../../../models/helpers/database_helpers/students_db_helper.dart';
import '../../account_settings_page/views/widgets/profile_info_widget.dart';
import '../controllers/student_profile_controller.dart';
import 'widgets/counters/illnesses_counter.dart';
import 'widgets/counters/psychological_statuses_counter.dart';
import 'widgets/counters/vaccines_counter.dart';
import 'widgets/student_address_information.dart';
import 'widgets/student_family_information.dart';
import 'widgets/student_main_information.dart';
import 'widgets/student_vaccines_and_illnesses_information.dart';
import '../../../tools/logic_tools/datetime_helper.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/custom_appbar.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class StudentProfile extends GetView<StudentProfileController> {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    // return Scaffold(
    //   appBar: CustomAppBar(
    //     title: controller.student.value.firstName,
    //     iconData: FontAwesomeIcons.child,
    //     backButtonEnabled: true,
    //   ),
    //   body: Container(
    //     color: Colors.red,
    //   ),
    // );
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.student.value.firstName,
        iconData: FontAwesomeIcons.child,
        backButtonEnabled: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const CircularProgressIndicator();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 310.h,
              decoration: BoxDecoration(
                color: themeData.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 20.h),
                    blurRadius: 12,
                    color: colorScheme.primary.withOpacity(.09),
                  ),
                ],
              ),
              padding: EdgeInsetsDirectional.only(
                top: 10.h,
                bottom: 10.h,
                start: 110.w,
                end: 10.w,
              ),
              child: Row(
                children: [
                  const Expanded(child: MainInfo()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: const VerticalDivider(),
                  ),
                  const Expanded(child: AddressInformation()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: const VerticalDivider(),
                  ),
                  Expanded(child: buildTODELETE(colorScheme)),
                  Expanded(
                    child: Column(
                      children: [
                        const PsychologicalStatusesCounter(),
                        AddVerticalSpacing(value: 10.h),
                        const IllnessesCounter(),
                        AddVerticalSpacing(value: 10.h),
                        const VaccinesCounter(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                FamilyInfo(),
                MedicalRecordInfo(),
              ],
            ),
          ],
        );
      }),
    );
  }

  Container buildTODELETE(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.only(top: 90.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconLabelItem(
            iconData: FontAwesomeIcons.calendarDays,
            label: DateTimeHelper.getDateWithoutTime(
                controller.student.value.joinDate),
            toolTip: "تاريخ التسجيل في المدرسة",
          ),
          AddVerticalSpacing(value: 15.h),
          Obx(() {
            if (controller.student.value.isActive) {
              return SizedBox(
                width: 200.w,
                child: CustomFilledButton(
                    backgroundColor: Colors.white,
                    onTap: () {
                      controller.student.value = controller.student.value
                          .copyWith(
                              isActive: !controller.student.value.isActive,
                              leaveDate: DateTime.now());

                      StudentsDBHelper.instance
                          .update(controller.student.value);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "مغادرة المدرسة",
                          style: ProjectFonts.displaySmall().copyWith(
                              color: colorScheme.error, fontSize: 16.sp),
                        ),
                        AddHorizontalSpacing(value: 15.w),
                        Icon(
                          FontAwesomeIcons.circleXmark,
                          color: colorScheme.error,
                        ),
                      ],
                    )),
              );
            }
            return SizedBox(
              width: 300.w,
              height: 70.h,
              child: CustomFilledButton(
                  backgroundColor: colorScheme.primary,
                  onTap: () {
                    controller.student.value = controller.student.value
                        .copyWith(
                            isActive: !controller.student.value.isActive,
                            leaveDate: null);

                    StudentsDBHelper.instance.update(controller.student.value);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "إعادة التسجيل في المدرسة",
                            style: ProjectFonts.displaySmall().copyWith(
                                color: colorScheme.onPrimary, fontSize: 16.sp),
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Text(
                            "${DateTimeHelper.getDateWithoutTime(controller.student.value.leaveDate!)} : تاريخ ترك المدرسة",
                            style: ProjectFonts.displaySmall().copyWith(
                                color: colorScheme.onPrimary, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      AddHorizontalSpacing(value: 15.w),
                      Icon(
                        FontAwesomeIcons.doorOpen,
                        color: colorScheme.onPrimary,
                      ),
                    ],
                  )),
            );
          }),
        ],
      ),
    );
  }
}
