import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/open_new_classrooms_dialog/dialogs/dialog_widgets/school_class_card.dart';
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
