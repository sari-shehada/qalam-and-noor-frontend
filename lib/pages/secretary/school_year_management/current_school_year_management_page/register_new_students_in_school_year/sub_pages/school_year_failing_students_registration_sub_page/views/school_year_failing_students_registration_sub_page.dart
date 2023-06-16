import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';

import '../../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../../school_year_succeeding_students_registration_sub_page/views/widgets/old_student_selection_card.dart';
import '../controllers/school_year_failing_students_registration_sub_page_controller.dart';

class SchoolYearFailingStudentsRegistrationSubPage
    extends GetView<SchoolYearFailingStudentsRegistrationSubPageController> {
  const SchoolYearFailingStudentsRegistrationSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Obx(
        () => FutureBuilder<List<Student>>(
          future: controller.students.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return ErrorLoadingSomethingWidget(
                somethingName:
                    'طلاب راسبين في المرحلة الدراسية السابقة للمرحلة المختارة',
                retryCallback: () => controller.reloadStudents(),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const EmptyItemWidget(
                  itemName:
                      'طلاب راسبين في المرحلة الدراسية السابقة للمرحلة المختارة',
                  iconData: FontAwesomeIcons.locationArrow, //TODO:
                  padding: EdgeInsets.zero,
                );
              } else {
                List<Student> students = snapshot.data as List<Student>;
                return ListView.separated(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    List<Color> backgroundColors = [
                      Get.theme.scaffoldBackgroundColor.withOpacity(.7),
                      Colors.white,
                    ];
                    return Obx(
                      () {
                        final Student student = students[index];
                        return OldStudentSelectionCard(
                          student: student,
                          isSelected:
                              controller.selectedStudents.contains(student),
                          backgroundColor: backgroundColors[index % 2],
                          toggleCallBack: () =>
                              controller.toggleStudent(student),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    indent: 20.w,
                    endIndent: 20.w,
                  ),
                );
              }
            } else {
              return const EmptyItemWidget(
                itemName:
                    'طلاب راسبين في المرحلة الدراسية السابقة للمرحلة المختارة',
                //TODO:
                iconData: FontAwesomeIcons.locationArrow,
                padding: EdgeInsets.zero,
              );
            }
          },
        ),
      ),
    );
  }
}
