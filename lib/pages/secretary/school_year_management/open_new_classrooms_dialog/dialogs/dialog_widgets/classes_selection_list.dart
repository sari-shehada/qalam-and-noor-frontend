import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';

import '../../dialog_controllers/open_new_classrooms_dialog_controller.dart';

class ClassesSelectionList extends GetView<OpenNewClassroomsDialogController> {
  const ClassesSelectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (controller.classesLoadingStatus.value) {
          case OpenNewClassroomsLoadingStatus.isLoading:
            {
              return const Center(
                child: LoaderWidget(),
              );
            }
          case OpenNewClassroomsLoadingStatus.hasData:
            {
              return ListView.separated(
                // padding: EdgeInsets.symmetric(vertical: 10.h),
                itemCount: controller.schoolClasses.length,
                itemBuilder: (context, index) {
                  return SchoolClassCard(
                    schoolClass: controller.schoolClasses[index],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 0,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
              );
            }
          case OpenNewClassroomsLoadingStatus.hasError:
            {
              return const Center(
                child: LoaderWidget(),
              );
            }
        }
      },
    );
  }
}

class SchoolClassCard extends GetView<OpenNewClassroomsDialogController> {
  const SchoolClassCard({
    super.key,
    required this.schoolClass,
  });

  final SchoolClass schoolClass;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.selectedClass.value != null &&
          controller.selectedClass.value == schoolClass;
      return AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isSelected
              ? Get.theme.colorScheme.primaryContainer
              : Get.theme.colorScheme.primaryContainer.withOpacity(0),
        ),
        duration: 500.milliseconds,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => controller.selectSchoolClass(schoolClass),
            child: AnimatedPadding(
              duration: 500.milliseconds,
              curve: Curves.fastLinearToSlowEaseIn,
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: isSelected ? 25.w : 15.w,
              ),
              child: Text(
                schoolClass.name,
                style: ProjectFonts.titleMedium().copyWith(
                  color: isSelected
                      ? Get.theme.colorScheme.primary
                      : Get.theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
