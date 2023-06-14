import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:test/test.dart';
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
        body: Obx(() {
          if (controller.isLoading.value) {
            return SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoaderWidget(),
                  AddVerticalSpacing(value: 40.h),
                  Text(
                    'جاري تحميل الصفحة الشخصية للطالب "${controller.student.value.firstName}"',
                    style: ProjectFonts.titleLarge(),
                  ),
                  AddVerticalSpacing(value: 40.h),
                  Obx(
                    () {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 300,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.r),
                              ),
                            ),
                            child: LinearProgressIndicator(
                              value: controller.loaderPercentage / 10,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Text(
                            'الخطوة ${controller.loaderPercentage} من 9',
                            style: ProjectFonts.bodyLarge().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            );
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
                      Text(
                        "البيانات الاساسية",
                        style: ProjectFonts.headlineSmall().copyWith(
                          fontWeight: FontWeight.bold,
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
                      //TODO:
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: const Divider(),
                      ),
                      Text(
                        "بيانات العائلة",
                        style: ProjectFonts.headlineSmall().copyWith(
                          fontWeight: FontWeight.bold,
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
                                    height: 200.h,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 10.h),
                                      itemCount:
                                          controller.studentSiblings.length +
                                              200,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(controller
                                              .student.value.firstName),
                                        );
                                        return Text(
                                          controller
                                              .studentSiblings[index].firstName,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.amber,
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.brown,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ],
              )),
            ],
          );
        }));
  }

  Row _buildActionButton(ColorScheme colorScheme) {
    return Row(
      children: [
        Obx(
          () {
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
