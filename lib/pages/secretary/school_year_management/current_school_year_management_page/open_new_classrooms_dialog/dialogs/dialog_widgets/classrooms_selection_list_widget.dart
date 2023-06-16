import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';

import '../../../../../../../configs/fonts.dart';
import '../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../../dialog_controllers/classrooms_selection_controller.dart';
import '../../dialog_controllers/open_new_classrooms_dialog_controller.dart';

class ClassroomsSelectionList extends GetView<ClassroomsSelectionController> {
  const ClassroomsSelectionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (Get.find<OpenNewClassroomsDialogController>().selectedClass.value ==
            null) {
          return Center(
            child: Text(
              'قم باختيار صف لعرض الشعب',
              style: ProjectFonts.titleLarge(),
            ),
          );
        }
        switch (controller.classroomsLoadingStatus.value) {
          case OpenNewClassroomsLoadingStatus.isLoading:
            {
              return const Center(
                child: LoaderWidget(),
              );
            }
          case OpenNewClassroomsLoadingStatus.hasData:
            {
              if (controller.availableClassrooms.isEmpty &&
                  controller.unAvailableClassrooms.isEmpty) {
                return const NoClassroomsToDisplayWidget(
                  minor: false,
                );
              }
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                children: [
                  AddVerticalSpacing(value: 10.h),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 20.w),
                    child: Text(
                      'الشعب المتاحة للفتح',
                      style: ProjectFonts.titleLarge(),
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  controller.availableClassrooms.isEmpty
                      ? const NoClassroomsToDisplayWidget()
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.availableClassrooms.length,
                          itemBuilder: (context, index) {
                            return ReadyToOpenClassroomCard(
                              classroom: controller.availableClassrooms[index],
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            height: 0,
                            indent: 20.w,
                            endIndent: 20.w,
                          ),
                        ),
                  Divider(
                    indent: 10.w,
                    endIndent: 10.w,
                    height: 0,
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 20.w),
                    child: Text(
                      'الشعب المفتوحة حاليا',
                      style: ProjectFonts.titleLarge(),
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  controller.unAvailableClassrooms.isEmpty
                      ? const NoClassroomsToDisplayWidget()
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.unAvailableClassrooms.length,
                          itemBuilder: (context, index) {
                            return AlreadyOpenClassroomCard(
                              classroom:
                                  controller.unAvailableClassrooms[index],
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            height: 0,
                            indent: 20.w,
                            endIndent: 20.w,
                          ),
                        ),
                ],
              );
            }
          case OpenNewClassroomsLoadingStatus.hasError:
            {
              print('Error Occured');
              return const Center(
                child: LoaderWidget(),
              );
            }
        }
      },
    );
  }
}

class NoClassroomsToDisplayWidget extends StatelessWidget {
  const NoClassroomsToDisplayWidget({
    super.key,
    this.minor = true,
  });

  final bool minor;

  @override
  Widget build(BuildContext context) {
    if (minor) {
      return SizedBox(
        height: 150.h,
        child: Center(
          child: Text(
            'لايوجد شعب لعرضها',
            style: ProjectFonts.titleLarge(),
          ),
        ),
      );
    }
    return Center(
      child: Text(
        'لايوجد شعب لعرضها',
        style: ProjectFonts.titleLarge(),
      ),
    );
  }
}

class ReadyToOpenClassroomCard extends GetView<ClassroomsSelectionController> {
  const ReadyToOpenClassroomCard({
    super.key,
    required this.classroom,
  });

  final Classroom classroom;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool isSelected = controller.toBeOpenedClassrooms.contains(classroom);
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
              onTap: () => controller.toggleToOpenClassroom(classroom),
              child: AnimatedPadding(
                duration: 500.milliseconds,
                curve: Curves.fastLinearToSlowEaseIn,
                padding: EdgeInsets.only(
                  top: 25.h,
                  bottom: 25.h,
                  right: isSelected ? 25.w : 15.w,
                  left: 25.w,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          classroom.name,
                          style: ProjectFonts.titleMedium().copyWith(
                            color: isSelected
                                ? Get.theme.colorScheme.primary
                                : Get.theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Spacer(),
                        AnimatedOpacity(
                          curve: Curves.fastLinearToSlowEaseIn,
                          opacity: isSelected ? 1 : 0,
                          duration: 300.milliseconds,
                          child: Icon(
                            Icons.check,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${classroom.maxCapacity} طالب',
                      style: ProjectFonts.titleMedium().copyWith(
                        color: isSelected
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AlreadyOpenClassroomCard extends GetView<ClassroomsSelectionController> {
  const AlreadyOpenClassroomCard({
    super.key,
    required this.classroom,
  });

  final Classroom classroom;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool isSelected = controller.toBeClosedClassrooms.contains(classroom);
        return AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            color: isSelected
                ? Get.theme.colorScheme.errorContainer
                : Get.theme.colorScheme.errorContainer.withOpacity(0),
          ),
          duration: 500.milliseconds,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => controller.toggleToCloseClassroom(classroom),
              child: AnimatedPadding(
                duration: 500.milliseconds,
                curve: Curves.fastLinearToSlowEaseIn,
                padding: EdgeInsets.only(
                  top: 25.h,
                  bottom: 25.h,
                  right: isSelected ? 25.w : 15.w,
                  left: 25.w,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          classroom.name,
                          style: ProjectFonts.titleMedium().copyWith(
                            color: isSelected
                                ? Get.theme.colorScheme.error
                                : Get.theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Spacer(),
                        AnimatedOpacity(
                          curve: Curves.fastLinearToSlowEaseIn,
                          opacity: isSelected ? 1 : 0,
                          duration: 300.milliseconds,
                          child: Icon(
                            Icons.close,
                            color: Get.theme.colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${classroom.maxCapacity} طالب',
                      style: ProjectFonts.titleMedium().copyWith(
                        color: isSelected
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
