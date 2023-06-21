import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/sub_widgets/current_school_year_shimmer_container.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../controllers/widget_controllers/school_year_classrooms_controller.dart';
import '../../controllers/widget_controllers/school_year_students_controller.dart';

class CurrentSchoolYearOptions extends StatelessWidget {
  const CurrentSchoolYearOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return CurrentSchoolYearShimmerContainer(
      buildChildWithContainer: true,
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 30.w),
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(value: 10.h),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: Text(
                'الإجرائات المتعلقة بالعام الدراسي الحالي',
                style: ProjectFonts.titleLarge(),
              ),
            ),
            AddVerticalSpacing(value: 40.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CurrentSchoolYearOptionWidget(
                        iconData: FontAwesomeIcons.userGroup,
                        title: 'تسجيل مجموعة طلاب جدد',
                        callback: () => Get.find<SchoolYearStudentsController>()
                            .enrollNewStudentsToSchoolYear(),
                        description:
                            'تسجيل مجموعة طلاب جدد في العام الدراسي الحالي',
                      ),
                      const Divider(),
                      CurrentSchoolYearOptionWidget(
                        iconData: FontAwesomeIcons.userClock,
                        title: 'تسجيل طالب متأخر عن الالتحاق بالمدرسة',
                        callback: () {},
                        description:
                            'تسجيل طالب متأخر عن الالتحاق بالمدرسة وتسجيل علامات الامتحانات التي قام زملاؤه بأدائها',
                      ),
                      const Divider(),
                      CurrentSchoolYearOptionWidget(
                        iconData: FontAwesomeIcons.stop,
                        title: 'انهاء الفصل الحالي',
                        callback: () {},
                        iconColor: Colors.red.shade400,
                        description:
                            'انهاء الفصل الحالي (بعد التحقق من انهاء ادخال علامات الطلاب)',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  width: 2.w,
                  color: Get.theme.colorScheme.onSurfaceVariant.withOpacity(.3),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CurrentSchoolYearOptionWidget(
                        iconData: FontAwesomeIcons.play,
                        title: 'بدء فصل جديد',
                        callback: () {},
                        description:
                            'بدء فصل دراسي جديد ضمن العام الدراسي (يشترط انهاء الفصل الحالي)',
                      ),
                      const Divider(),
                      CurrentSchoolYearOptionWidget(
                        iconData: FontAwesomeIcons.chalkboardUser,
                        title: 'ادارة الشعب في العام الدراسي الحالي',
                        callback: () =>
                            Get.find<SchoolYearClassroomsController>()
                                .manageClassroomsInSchoolYear(),
                        description:
                            'فتح و إغلاق شعب ضمن العام الدراسي ضمن المراحل الدراسية في المدرسة و ذلك لغرض تسجيل الطلاب فيها',
                      ),
                      const Divider(),
                      CurrentSchoolYearOptionWidget(
                        iconData: FontAwesomeIcons.schoolLock,
                        title: 'انهاء العام الدراسي الحالي',
                        callback: () {},
                        iconColor: Colors.red.shade400,
                        description:
                            'انهاء العام الدراسي الحالي وقفل نتائج الطلاب المنتسبة',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentSchoolYearOptionWidget extends StatelessWidget {
  const CurrentSchoolYearOptionWidget({
    super.key,
    required this.title,
    required this.iconData,
    this.iconColor,
    required this.description,
    required this.callback,
  });

  final String title;
  final IconData iconData;
  final Color? iconColor;
  final String description;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        iconData,
        color: iconColor,
      ),
      title: Text(
        title,
        style: ProjectFonts.titleLarge().copyWith(
          color: iconColor ?? Get.theme.colorScheme.onSurfaceVariant,
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 6.h),
        child: Text(
          description,
          style: ProjectFonts.bodyLarge(),
        ),
      ),
      onTap: callback,
    );
  }
}
