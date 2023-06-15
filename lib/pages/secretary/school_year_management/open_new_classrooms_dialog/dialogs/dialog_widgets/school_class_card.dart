import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../configs/fonts.dart';
import '../../../../../../models/educational/school_class.dart';
import '../../dialog_controllers/open_new_classrooms_dialog_controller.dart';

class SchoolClassCard extends GetView<OpenNewClassroomsDialogController> {
  const SchoolClassCard({
    super.key,
    required this.schoolClass,
  });

  final SchoolClass schoolClass;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
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
      },
    );
  }
}
