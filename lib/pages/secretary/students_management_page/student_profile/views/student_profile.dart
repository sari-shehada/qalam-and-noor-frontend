import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/counters/illnesses_counter.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/counters/psychological_statuses_counter.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/counters/vaccines_counter.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_medical_information.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_score_page/controllers/student_score_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_score_page/views/student_score_page.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../models/helpers/database_helpers/students_db_helper.dart';
import '../../../../shared/account_settings_page/views/widgets/profile_info_widget.dart';
import '../controllers/student_profile_controller.dart';
import 'widgets/student_address_information.dart';
import 'widgets/student_info_tab.dart';
import 'widgets/student_main_information.dart';
import '../../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../../tools/ui_tools/buttons.dart';
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
        actionButton: _buildActionButton(colorScheme),
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
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              GlobalStyles.globalBorderRadius,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Text(
                            "البيانات الاساسية",
                            style: ProjectFonts.headlineSmall().copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Expanded(child: StudentMainInfo()),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: const VerticalDivider(),
                            ),
                            const Expanded(
                                flex: 2, child: StudentAddressInformation()),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              GlobalStyles.globalBorderRadius,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Text(
                            "بيانات العائلة",
                            style: ProjectFonts.headlineSmall().copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: StudentInfoTab(
                                title: 'بيانات الأب',
                                children: [
                                  _SingleLineDetailWithIcon(
                                    detailText:
                                        '${controller.father.firstName} ${controller.father.lastName}',
                                    icon: FontAwesomeIcons.userTie,
                                    toolTipText: 'اسم الاب',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText: controller.father.career,
                                    icon: FontAwesomeIcons.briefcase,
                                    toolTipText: 'مهنة الاب',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText: controller.father.phoneNumber,
                                    icon: FontAwesomeIcons.mobile,
                                    toolTipText: 'رقم الاب',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText:
                                        '${controller.father.tiePlace} ${controller.father.tieNumber}',
                                    icon: FontAwesomeIcons.locationDot,
                                    toolTipText: 'قيد الاب',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText:
                                        controller.father.permenantAddress,
                                    icon: FontAwesomeIcons.solidAddressCard,
                                    toolTipText: 'عنوان الاب الدائم',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: const VerticalDivider(),
                            ),
                            Expanded(
                              child: StudentInfoTab(
                                title: 'بيانات الأم',
                                children: [
                                  _SingleLineDetailWithIcon(
                                    detailText:
                                        '${controller.mother.firstName} ${controller.mother.lastName}',
                                    icon: FontAwesomeIcons.userTie,
                                    toolTipText: 'اسم الأم',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText: controller.mother.career,
                                    icon: FontAwesomeIcons.briefcase,
                                    toolTipText: 'مهنة الأم',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText: controller.mother.phoneNumber,
                                    icon: FontAwesomeIcons.mobile,
                                    toolTipText: 'رقم الأم',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText:
                                        '${controller.mother.tiePlace} ${controller.mother.tieNumber}',
                                    icon: FontAwesomeIcons.locationDot,
                                    toolTipText: 'قيد الأم',
                                  ),
                                  AddVerticalSpacing(value: 13.h),
                                  _SingleLineDetailWithIcon(
                                    detailText:
                                        controller.mother.doesLiveWithHasband
                                            ? 'تعيش مع الأب'
                                            : '-----',
                                    icon: FontAwesomeIcons.solidAddressCard,
                                    toolTipText: 'عنوان الأم الدائم',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: const VerticalDivider(),
                            ),
                            Expanded(
                              child: StudentInfoTab(
                                isListViewBased: true,
                                title: 'بيانات الأخوة',
                                //TODO: Make Items Clickable
                                children: [
                                  SizedBox(
                                    height: 190.h,
                                    child: Builder(builder: (context) {
                                      if (controller.studentSiblings.isEmpty) {
                                        return Column(
                                          children: [
                                            const Spacer(),
                                            Text(
                                                'ليس لدى "${controller.student.value.firstName}" أي أخوة'),
                                            const Spacer(),
                                          ],
                                        );
                                      }
                                      return ListView.separated(
                                        padding: EdgeInsets.only(top: 15.h),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(height: 5.h),
                                        itemCount:
                                            controller.studentSiblings.length,
                                        itemBuilder: (context, index) {
                                          return Tooltip(
                                            message:
                                                'تحميل صفحة الطالب "${controller.studentSiblings[index].firstName}"',
                                            child: InkWell(
                                              onTap: () {
                                                log("Called On Tap");
                                                Get.off(
                                                  () => const StudentProfile(),
                                                  binding: BindingsBuilder(
                                                    () {
                                                      Get.put(
                                                        StudentProfileController(
                                                          student: controller
                                                              .studentSiblings[
                                                                  index]
                                                              .obs,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                ),
                                                height: 50.h,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(GlobalStyles
                                                        .globalBorderRadius),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${controller.studentSiblings[index].firstName} ${controller.father.lastName}',
                                                      style: ProjectFonts
                                                          .bodyLarge(),
                                                    ),
                                                    Icon(
                                                      controller
                                                              .studentSiblings[
                                                                  index]
                                                              .isMale
                                                          ? Icons.male
                                                          : Icons.female,
                                                      color: controller
                                                              .studentSiblings[
                                                                  index]
                                                              .isMale
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .primary
                                                          : Colors.pink[300],
                                                      size: 27.sp,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              GlobalStyles.globalBorderRadius,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Text(
                            'البيانات الصحية',
                            style: ProjectFonts.headlineSmall().copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
                          color: Theme.of(context).colorScheme.primary,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: controller.currentClassInfo == null
                            ? Column(
                                children: [
                                  AddVerticalSpacing(value: 20.h),
                                  Text(
                                    "الطالب غير مسجل في سنة دراسية حاليا",
                                    style: ProjectFonts.headlineMedium(),
                                  ),
                                  AddVerticalSpacing(value: 50.h),
                                  FaIcon(
                                    FontAwesomeIcons.school,
                                    color: colorScheme.primary,
                                    size: 50.sp,
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconLabelItem(
                                    iconData: Icons.class_,
                                    label:
                                        "الصف: ${controller.currentClassInfo!.schoolClass.name}",
                                    toolTip: "الصف حالي للطالب",
                                  ),
                                  IconLabelItem(
                                    iconData: Icons.school,
                                    label:
                                        "الشعبة: ${controller.currentClassInfo!.classroom.name}",
                                    toolTip: "الشعبة الحالية للطالب",
                                  ),
                                ],
                              ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Builder(
                          builder: (context) {
                            if (controller.studentYearRecords.isEmpty) {
                              return const Column(
                                children: [
                                  Icon(Icons.text_snippet),
                                  Text('السجلات السنوية'),
                                ],
                              );
                            }
                            return ListView.separated(
                              itemCount: controller.studentYearRecords.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => const StudentScorePage(),
                                      binding: BindingsBuilder(
                                        () {
                                          Get.put(StudentScoreController(
                                            student: controller.student.value,
                                            schoolYear: controller
                                                .studentYearRecords[index],
                                          ));
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 15.h,
                                      horizontal: 60.w,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    height: 60.h,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: controller
                                              .studentYearRecords[index]
                                              .isFinished
                                          ? colorScheme.background
                                          : colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            GlobalStyles.globalBorderRadius),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "السنة الدراسية: ${controller.studentYearRecords[index].name}",
                                          style: ProjectFonts.headlineSmall()
                                              .copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        FaIcon(
                                          controller.studentYearRecords[index]
                                                  .isFinished
                                              ? FontAwesomeIcons.circleCheck
                                              : FontAwesomeIcons.exclamation,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                            );
                          },
                        ),
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

  Row _buildActionButton(ColorScheme colorScheme) {
    return Row(
      children: [
        Obx(
          () {
            if (controller.isLoading.value) {
              return const SizedBox.shrink();
            }
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

                    StudentsDBHelper.instance.update(controller.student.value);
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
                  ),
                ),
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
          },
        ),
      ],
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

                    StudentsDBHelper.instance.update(controller.student.value);
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
                  ),
                ),
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

class _StudentProfileLoadingWidget extends StatelessWidget {
  const _StudentProfileLoadingWidget({
    super.key,
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

class _SingleLineDetailWithIcon extends StatelessWidget {
  const _SingleLineDetailWithIcon({
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
                fontSize: 19.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
