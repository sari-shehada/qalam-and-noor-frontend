import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/counters/illnesses_counter.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/counters/psychological_statuses_counter.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/counters/vaccines_counter.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/headline_divider.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_medical_information.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_profile_father_info.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_profile_mother_info.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_profile_siblings_info.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_profile_year_record_list.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import '../../../../../configs/fonts.dart';
import '../../../../shared/account_settings_page/views/widgets/profile_info_widget.dart';
import '../controllers/student_profile_controller.dart';
import 'widgets/student_address_information.dart';
import 'widgets/student_main_information.dart';
import '../../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class StudentProfile extends GetView<StudentProfileController> {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.student.value.firstName,
        iconData: FontAwesomeIcons.child,
        backButtonEnabled: true,
        actionButton: FilledButton(
          onPressed: () {},
          child: const Text("بدء محادثة مع أهل الطالب"),
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return _StudentProfileLoadingWidget(controller: controller);
          }
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(GlobalStyles.globalBorderRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF393939).withOpacity(.06),
                        blurRadius: 60,
                        offset: const Offset(0, 30),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                    top: 10.h,
                    right: 10.w,
                    bottom: 10.h,
                  ),
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                  ),
                  child: Column(
                    children: [
                      const HeadlineDivider(header: "البيانات الاساسية"),
                      Expanded(
                        child: Row(
                          children: [
                            const Expanded(
                              child: StudentMainInfo(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: const VerticalDivider(),
                            ),
                            const Expanded(
                              flex: 2,
                              child: StudentAddressInformation(),
                            ),
                          ],
                        ),
                      ),
                      const HeadlineDivider(header: "بيانات العائلة"),
                      Expanded(
                        child: Row(
                          children: [
                            const Expanded(
                              child: StudentProfileFatherInfo(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: const VerticalDivider(),
                            ),
                            const Expanded(
                              child: StudentProfileMotherInfo(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: const VerticalDivider(),
                            ),
                            const Expanded(
                              child: StudentProfileSiblingsInfo(),
                            ),
                          ],
                        ),
                      ),
                      const HeadlineDivider(header: 'البيانات الصحية'),
                      Expanded(
                        child: Column(
                          children: [
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const IllnessesCounter(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child: Container(
                                    width: 1,
                                    height: 150.h,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const PsychologicalStatusesCounter(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child: Container(
                                    width: 1,
                                    height: 150.h,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const VaccinesCounter(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child: Container(
                                    width: 1,
                                    height: 150.h,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const StudentMedicalRecordInfo(),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(GlobalStyles.globalBorderRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF393939).withOpacity(.06),
                        blurRadius: 60,
                        offset: const Offset(0, 30),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                    top: 10.h,
                    bottom: 10.h,
                    left: 10.w,
                    right: 10.w,
                  ),
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.25),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              GlobalStyles.globalBorderRadius,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Text(
                            "السجل السنوي الحالي",
                            style: ProjectFonts.headlineSmall().copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: controller.currentClassInfo == null
                            ? Column(
                                children: [
                                  const Spacer(),
                                  Text(
                                    "الطالب غير مسجل في السنة الدراسية الحالية",
                                    style: ProjectFonts.titleMedium().copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 40.h),
                                  FaIcon(
                                    FontAwesomeIcons.schoolCircleXmark,
                                    size: 70.sp,
                                    color: Colors.grey,
                                  ),
                                  const Spacer(),
                                ],
                              )
                            : Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconLabelItem(
                                      iconData: Icons.class_,
                                      label: controller.student.value.isMale
                                          ? "يدرس  في الصف: ${controller.currentClassInfo!.schoolClass.name}"
                                          : "تدرس  في الصف: ${controller.currentClassInfo!.schoolClass.name}",
                                      toolTip: "الصف الحالي للطالب",
                                    ),
                                    IconLabelItem(
                                      iconData: Icons.school,
                                      label: controller.student.value.isMale
                                          ? "يحضر في الشعبة: ${controller.currentClassInfo!.classroom.name}"
                                          : "تحضر في الشعبة: ${controller.currentClassInfo!.classroom.name}",
                                      toolTip: "الشعبة الحالية للطالب",
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.25),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              GlobalStyles.globalBorderRadius,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Text(
                            "السجلات السنوية",
                            style: ProjectFonts.headlineSmall().copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 9,
                        child: StudentProfileYearRecordList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StudentProfileLoadingWidget extends StatelessWidget {
  const _StudentProfileLoadingWidget({
    required this.controller,
  });

  final StudentProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoaderWidget(),
          AddVerticalSpacing(value: 40.h),
          Text(
            controller.student.value.isMale
                ? 'جاري تحميل الصفحة الشخصية للطالب "${controller.student.value.firstName}"'
                : 'جاري تحميل الصفحة الشخصية للطالبة "${controller.student.value.firstName}"',
            style: ProjectFonts.titleLarge(),
          ),
        ],
      ),
    );
  }
}

class SingleLineDetailWithIcon extends StatelessWidget {
  const SingleLineDetailWithIcon({
    super.key,
    required this.detailText,
    required this.icon,
    required this.toolTipText,
    this.iconSize = 30,
  });
  final String detailText;
  final IconData icon;
  final double iconSize;
  final String toolTipText;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipText,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: iconSize.w,
            child: Center(
              child: FaIcon(
                icon,
                color: Get.theme.colorScheme.primary,
                size: iconSize.sp,
              ),
            ),
          ),
          AddHorizontalSpacing(value: 12.w),
          SizedBox(
            width: 250.w,
            child: Text(
              detailText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ProjectFonts.titleMedium().copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 17.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
