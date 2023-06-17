import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';

import '../../../../../../../../../configs/fonts.dart';
import '../../controllers/class_selection_sub_page_controller.dart';

class SchoolClassSelectionCard
    extends GetView<ClassSelectionSubPageController> {
  const SchoolClassSelectionCard({
    super.key,
    required this.backgroundColor,
    required this.schoolClass,
  });

  final SchoolClass schoolClass;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool isSelected = controller.selectedClass.value == schoolClass;
        return AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            color: isSelected
                ? Get.theme.colorScheme.primaryContainer
                : backgroundColor,
          ),
          duration: 500.milliseconds,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => controller.selectClass(schoolClass),
              child: AnimatedPadding(
                duration: 500.milliseconds,
                curve: Curves.fastLinearToSlowEaseIn,
                padding: EdgeInsets.only(
                  top: 25.h,
                  bottom: 25.h,
                  right: isSelected ? 25.w : 15.w,
                  left: 25.w,
                ),
                child: Row(
                  children: [
                    Text(
                      schoolClass.name,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
