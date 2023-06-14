import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../controllers/navigation_controller.dart';

class DashboardButtonShortcutsWidget extends StatelessWidget {
  const DashboardButtonShortcutsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardButtonShortcutsWidgetController controller = Get.put(
      DashboardButtonShortcutsWidgetController(),
    );
    final ColorScheme colorScheme = Get.theme.colorScheme;
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => controller.registerNewStudent(),
              onHover: (value) {
                if (value) {
                  controller.hoverButton(
                    DashboardButtonShortcutsWidgetSelectedButton.student,
                  );
                } else {
                  controller.cancelHover();
                }
              },
              child: Obx(
                () => AnimatedOpacity(
                  duration: _DashboardButtonShortcutsWidgetConstants
                      .animationDuration,
                  curve:
                      _DashboardButtonShortcutsWidgetConstants.animationCurve,
                  opacity: controller.currentSelectedButton.value ==
                          DashboardButtonShortcutsWidgetSelectedButton.employee
                      ? 0.5
                      : 1,
                  child: AnimatedContainer(
                    alignment: Alignment.centerLeft,
                    duration: _DashboardButtonShortcutsWidgetConstants
                        .animationDuration,
                    curve:
                        _DashboardButtonShortcutsWidgetConstants.animationCurve,
                    padding: EdgeInsetsDirectional.only(
                      end: 40.w,
                      top: controller.currentSelectedButton.value ==
                              DashboardButtonShortcutsWidgetSelectedButton
                                  .student
                          ? 50.h
                          : 40.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: controller.currentSelectedButton.value ==
                              DashboardButtonShortcutsWidgetSelectedButton
                                  .student
                          ? [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                color: Colors.black.withOpacity(.07),
                                blurRadius: 30,
                              )
                            ]
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.graduationCap,
                          size: 55.sp,
                          color: colorScheme.primary,
                        ),
                        AddVerticalSpacing(value: 20.h),
                        Text(
                          'تسجيل طالب جديد',
                          style: ProjectFonts.headlineLarge(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            height: 1.h,
            decoration: BoxDecoration(
              color: colorScheme.onSurfaceVariant.withOpacity(.4),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => controller.registerNewEmployee(),
              onHover: (value) {
                if (value) {
                  controller.hoverButton(
                    DashboardButtonShortcutsWidgetSelectedButton.employee,
                  );
                } else {
                  controller.cancelHover();
                }
              },
              child: Obx(
                () => AnimatedOpacity(
                  duration: _DashboardButtonShortcutsWidgetConstants
                      .animationDuration,
                  curve:
                      _DashboardButtonShortcutsWidgetConstants.animationCurve,
                  opacity: controller.currentSelectedButton.value ==
                          DashboardButtonShortcutsWidgetSelectedButton.student
                      ? 0.5
                      : 1,
                  child: AnimatedContainer(
                    alignment: Alignment.centerRight,
                    duration: _DashboardButtonShortcutsWidgetConstants
                        .animationDuration,
                    curve:
                        _DashboardButtonShortcutsWidgetConstants.animationCurve,
                    padding: EdgeInsetsDirectional.only(
                      start: 40.w,
                      bottom: controller.currentSelectedButton.value ==
                              DashboardButtonShortcutsWidgetSelectedButton
                                  .employee
                          ? 50.h
                          : 40.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: controller.currentSelectedButton.value ==
                              DashboardButtonShortcutsWidgetSelectedButton
                                  .employee
                          ? [
                              BoxShadow(
                                offset: const Offset(0, -10),
                                color: Colors.black.withOpacity(.05),
                                blurRadius: 30,
                              )
                            ]
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.userTie,
                          size: 55.sp,
                          color: colorScheme.primary,
                        ),
                        AddVerticalSpacing(value: 20.h),
                        Text(
                          'تسجيل موظف جديد',
                          style: ProjectFonts.headlineLarge(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardButtonShortcutsWidgetConstants {
  static Duration animationDuration = 300.milliseconds;
  static Curve animationCurve = Curves.fastLinearToSlowEaseIn;
}

class DashboardButtonShortcutsWidgetController extends GetxController {
  Rx<DashboardButtonShortcutsWidgetSelectedButton> currentSelectedButton =
      DashboardButtonShortcutsWidgetSelectedButton.none.obs;

  hoverButton(DashboardButtonShortcutsWidgetSelectedButton target) {
    currentSelectedButton.value = target;
  }

  cancelHover() {
    currentSelectedButton.value =
        DashboardButtonShortcutsWidgetSelectedButton.none;
  }

  void registerNewEmployee() {
    NavigationController.toAddNewEmployeePage();
  }

  void registerNewStudent() {
    NavigationController.toAddNewStudentPage();
  }
}

enum DashboardButtonShortcutsWidgetSelectedButton {
  none,
  student,
  employee,
}
