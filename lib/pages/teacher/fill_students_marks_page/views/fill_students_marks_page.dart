import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/teacher/fill_students_marks_page/controllers/fill_students_marks_controller.dart';

import '../../../../configs/fonts.dart';
import '../../../../models/agendas/student.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/ui_tools/loader_widget.dart';
import '../../../../tools/widgets/empty_item_widget.dart';
import '../../../../tools/widgets/error_loading_something_widget.dart';
import '../../dashboard_page/views/widgets/student_fill_mark_card.dart';

class FillStudentsMarksPage extends GetView<FillStudentMarksController> {
  const FillStudentsMarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        backButtonEnabled: true,
        title: 'تسجيل علامات الطلاب',
        iconData: FontAwesomeIcons.gripVertical,
        actionButton: SearchBar(
          controller: controller.searchFieldController,
          backgroundColor: MaterialStateProperty.all(
            Get.theme.scaffoldBackgroundColor,
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 30.w),
          ),
          trailing: [
            IconButton(
              tooltip: 'اعادة تعيين النتائج',
              onPressed: () => controller.clearSearchData(),
              icon: const Icon(Icons.clear),
            ),
            IconButton(
              tooltip: 'إجراء البحث',
              onPressed: () => controller.performSearch(),
              icon: const Icon(Icons.search),
            ),
          ],
          hintText: 'البحث حسب اسم الطالب او رقم السجل العام',
          elevation: const MaterialStatePropertyAll(4),
          shadowColor: MaterialStateProperty.all(
            Get.theme.colorScheme.shadow.withOpacity(.09),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(
              start: 80.w,
              end: 90.w,
            ),
            height: 100.h,
            decoration: BoxDecoration(
              color: Get.theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10.h),
                  blurRadius: 10,
                  color: Get.theme.colorScheme.shadow.withOpacity(.09),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  'طلاب الشعبة',
                  style: ProjectFonts.headlineMedium(),
                ),
                const Spacer(),
                Text(
                  "العلامة الكلية : ${controller.fullMark} درجات",
                  style: ProjectFonts.headlineMedium(),
                ),
              ],
            ),
          ),
          Obx(() {
            return Expanded(
              child: FutureBuilder(
                future: controller.students.value,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoaderWidget(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<Student> students = snapshot.data!;
                      if (students.isEmpty) {
                        return const EmptyItemWidget(
                          itemName: 'طلاب',
                          iconData: FontAwesomeIcons.graduationCap,
                        );
                      } else {
                        List<Color> backgroundColors = [
                          Colors.transparent,
                          Colors.white,
                        ];
                        return ListView.builder(
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            Student student = students[index];
                            return StudentFillMarkCard(
                              student: student,
                              backgroundColor: backgroundColors[index % 2],
                            );
                          },
                        );
                      }
                    }
                    if (snapshot.hasError) {
                      return ErrorLoadingSomethingWidget(
                        somethingName: 'طلاب',
                        retryCallback: () => controller.refreshStudents(),
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
