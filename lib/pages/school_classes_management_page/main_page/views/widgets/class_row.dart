import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_classes_management_page/courses_management/controllers/courses_management_controller.dart';
import 'package:kalam_noor/pages/school_classes_management_page/courses_management/views/courses_management_page.dart';
import 'package:kalam_noor/pages/school_classes_management_page/main_page/controllers/school_classes_management_controller.dart';
import 'package:kalam_noor/pages/school_classes_management_page/school_classes_detailes_page/controllers/school_class_details_controller.dart';
import 'package:kalam_noor/pages/school_classes_management_page/school_classes_detailes_page/views/school_class_details_page.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import '../../../../../models/educational/school_class.dart';
import '../school_classes_management_page.dart';

class SchoolClassRow extends StatelessWidget {
  const SchoolClassRow(
      {super.key, required this.schoolClass, required this.rowColor});
  final SchoolClass schoolClass;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    SchoolClassManagementController controller = Get.find();
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                flex: 85,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  alignment: Alignment.centerRight,
                  child: Text(
                    schoolClass.name,
                    style: textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(
                            const CoursesManagementPage(),
                            binding: BindingsBuilder(
                              () {
                                Get.put(
                                  CoursesManagementController(
                                    schoolClass: schoolClass,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        tooltip: 'إدارة المقررات في الصف',
                        icon: Icon(
                          Icons.book,
                          color: Get.theme.colorScheme.primary.withOpacity(.7),
                        ),
                      ),
                      // const AddHorizontalSpacing(value: 10),
                      IconButton(
                        onPressed: () =>
                            controller.updateSchoolClassInfo(schoolClass),
                        tooltip: 'إدارة بنية الامتحانات للصف',
                        icon: Icon(
                          //TODO: Change this later
                          Icons.find_replace,
                          color: Get.theme.colorScheme.primary.withOpacity(.7),
                        ),
                      ),
                      // const AddHorizontalSpacing(value: 10),
                      IconButton(
                        onPressed: () => Get.to(
                          const SchoolClassDetailsPage(),
                          binding: BindingsBuilder(
                            () {
                              Get.put(
                                SchoolClassDetailsController(
                                    schoolClass: schoolClass),
                              );
                            },
                          ),
                        ),
                        tooltip: 'إدارة الشعب للصف',
                        icon: Icon(
                          //TODO: Change this later
                          Icons.find_replace,
                          color: Get.theme.colorScheme.primary.withOpacity(.7),
                        ),
                      ),
                      // const AddHorizontalSpacing(value: 10),
                      IconButton(
                        onPressed: () =>
                            controller.updateSchoolClassInfo(schoolClass),
                        tooltip: 'تعديل معلومات الصف',
                        icon: Icon(
                          Icons.edit,
                          color: Get.theme.colorScheme.primary.withOpacity(.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
