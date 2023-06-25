import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/controllers/student_profile_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/student_profile.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_info_tab.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../configs/styles.dart';

class StudentProfileSiblingsInfo extends GetView<StudentProfileController> {
  const StudentProfileSiblingsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StudentInfoTab(
      isListViewBased: true,
      title: 'بيانات الأخوة',
      //TODO: Make Items Clickable
      children: [
        SizedBox(
          height: 180.h,
          child: Builder(builder: (context) {
            if (controller.studentSiblings.isEmpty) {
              return Column(
                children: [
                  const Spacer(),
                  Text(
                      'ليس لدى "${controller.student.value.firstName}" أي أخوة'),
                  const Spacer(),
                ],
              );
            }
            return ListView.separated(
              padding: EdgeInsets.only(top: 15.h),
              separatorBuilder: (context, index) => SizedBox(height: 5.h),
              itemCount: controller.studentSiblings.length,
              itemBuilder: (context, index) {
                return Tooltip(
                  message:
                      'تحميل صفحة الطالب "${controller.studentSiblings[index].firstName}"',
                  child: InkWell(
                    onTap: () {
                      print("Called On Tap");
                      Get.off(
                        () => const StudentProfile(),
                        binding: BindingsBuilder(
                          () {
                            Get.put(
                              StudentProfileController(
                                student: controller.studentSiblings[index].obs,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      height: 50.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(GlobalStyles.globalBorderRadius),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.studentSiblings[index].firstName} ${controller.father.lastName}',
                            style: ProjectFonts.bodyLarge(),
                          ),
                          Icon(
                            controller.studentSiblings[index].isMale
                                ? Icons.male
                                : Icons.female,
                            color: controller.studentSiblings[index].isMale
                                ? Theme.of(context).colorScheme.primary
                                : Colors.pink[300],
                            size: 27.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
