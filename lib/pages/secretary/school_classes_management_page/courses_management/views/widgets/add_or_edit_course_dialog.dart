import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/pages/secretary/school_classes_management_page/courses_management/controllers/dialog_controllers/add_or_edit_course_dialog_controller.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../models/agendas/employee.dart';
import '../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

class AddOrEditCourseDialog extends StatelessWidget {
  const AddOrEditCourseDialog({super.key, this.argument});

  final dynamic argument;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    AddOrEditCourseDialogController controller = Get.put(
      AddOrEditCourseDialogController(argument: argument),
    );
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          width: 600.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.transparent,
          ),
          padding: EdgeInsetsDirectional.only(
              start: 30.w, end: 30.w, top: 20.h, bottom: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return Text(
                  controller.isEditMode.value == false
                      ? 'إضافة مقرر'
                      : 'تعديل معلومات المقرر',
                  style: textTheme.headlineMedium,
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'إسم المقرر',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.courseNameController,
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              LabeledWidget(
                label: 'العلامة الكاملة',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.courseTotalGradeController,
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              LabeledWidget(
                label: "مدرس المقرر",
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 49.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Get.theme.colorScheme.primaryContainer
                              .withOpacity(.5),
                        ),
                        padding: EdgeInsetsDirectional.only(end: 20.w),
                        child: Obx(
                          () => controller.isProcessing.value
                              ? LoaderWidget(
                                  size: 30.sp,
                                )
                              : DropdownButton<Employee>(
                                  value: controller.selectedTeacher.value,
                                  onChanged: (value) =>
                                      controller.selectTeacher(value),
                                  borderRadius: BorderRadius.circular(14.r),
                                  elevation: 5,
                                  dropdownColor:
                                      Get.theme.colorScheme.primaryContainer,
                                  style: TextStyle(
                                    fontFamily: ProjectFonts.fontFamily,
                                    fontSize: 24.sp,
                                    color: Get.theme.colorScheme.primary,
                                  ),
                                  isExpanded: true,
                                  underline: const SizedBox.shrink(),
                                  items: controller.teachers
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.only(
                                              start: 30.w,
                                            ),
                                            child: Text(
                                                "${e.firstName} ${e.lastName}"),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                        ),
                      ),
                    ),
                    AddHorizontalSpacing(value: 10.w),
                    CustomFilledButton(
                        height: 49.h,
                        width: 120.w,
                        onTap: () =>
                            NavigationController.toAddNewEmployeePage(),
                        child: 'إضافة جديد'),
                  ],
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              LabeledWidget(
                label: 'نوع المقرر',
                child: Obx(
                  () {
                    return AnimatedContainer(
                      decoration: BoxDecoration(
                        color: controller.isEnriching.value == true
                            ? Get.theme.colorScheme.primaryContainer
                            : Get.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      duration: const Duration(milliseconds: 700),
                      child: Material(
                        borderRadius: BorderRadius.circular(14.r),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14.r),
                          splashColor: Colors.transparent,
                          onTap: () => controller.toggleType(),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.isEnriching.value == true
                                        ? 'إثرائي'
                                        : 'إلزامي',
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      color:
                                          controller.isEnriching.value == true
                                              ? Get.theme.colorScheme.primary
                                              : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      height: 50.h,
                      onTap: () => Get.back(),
                      child: 'إلغاء الإجراء',
                    ),
                  ),
                  AddHorizontalSpacing(value: 20.w),
                  Expanded(
                    child: Obx(
                      () => controller.isEditMode.value == false
                          ? CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.addCourse(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.updateCourseInfo(),
                              child: 'إجراء التعديل',
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
