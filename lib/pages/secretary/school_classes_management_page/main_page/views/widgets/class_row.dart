import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../courses_management/controllers/courses_management_controller.dart';
import '../../../courses_management/views/courses_management_page.dart';
import '../../controllers/school_classes_management_controller.dart';
import '../../../school_classes_detailes_page/controllers/school_class_details_controller.dart';
import '../../../school_classes_detailes_page/views/school_class_details_page.dart';
import '../../../../../../models/educational/school_class.dart';

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
                flex: 22,
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
                flex: 20,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  alignment: Alignment.centerRight,
                  child: Text(
                    schoolClass.yearDropCourseCount.toString(),
                    style: textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(7.sp),
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
                        iconSize: 24.sp,
                        icon: Icon(
                          Icons.book,
                          color: Get.theme.colorScheme.primary.withOpacity(.7),
                        ),
                      ),
                      // const AddHorizontalSpacing(value: 10),
                      IconButton(
                        padding: EdgeInsets.all(7.sp),
                        onPressed: () =>
                            controller.updateSchoolClassInfo(schoolClass),
                        tooltip: 'إدارة بنية الامتحانات للصف',
                        iconSize: 24.sp,
                        icon: Icon(
                          Icons.percent,
                          color: Get.theme.colorScheme.primary.withOpacity(.7),
                        ),
                      ),
                      // const AddHorizontalSpacing(value: 10),
                      IconButton(
                        padding: EdgeInsets.all(7.sp),
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
                        iconSize: 24.sp,
                        tooltip: 'إدارة الشعب للصف',
                        icon: Icon(
                          Icons.domain_add_rounded,
                          color: Get.theme.colorScheme.primary.withOpacity(.7),
                        ),
                      ),
                      // const AddHorizontalSpacing(value: 10),
                      IconButton(
                        padding: EdgeInsets.all(7.sp),
                        onPressed: () =>
                            controller.updateSchoolClassInfo(schoolClass),
                        tooltip: 'تعديل معلومات الصف',
                        iconSize: 24.sp,
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
