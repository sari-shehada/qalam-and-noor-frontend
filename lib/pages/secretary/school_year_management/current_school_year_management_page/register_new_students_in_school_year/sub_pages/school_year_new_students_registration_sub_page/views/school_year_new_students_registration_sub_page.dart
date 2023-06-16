import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/main_page/models/school_year_student_registeration_model.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/school_year_new_students_registration_sub_page/views/widgets/classroom_selection_card%20copy.dart';

import '../../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../controllers/school_year_new_students_registration_sub_page_controller.dart';

class SchoolYearNewStudentsRegistrationSubPage
    extends GetView<SchoolYearNewStudentsRegistrationSubPageController> {
  const SchoolYearNewStudentsRegistrationSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Obx(
        () => FutureBuilder<List<SchoolYearNewStudentRegistrationModel>>(
          future: controller.students.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return ErrorLoadingSomethingWidget(
                somethingName: 'طلاب جدد للمرحلة الدراسية المختارة',
                retryCallback: () => controller.reloadStudents(),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const EmptyItemWidget(
                  itemName: 'طلاب جدد للمرحلة الدراسية المختارة',
                  iconData: FontAwesomeIcons.locationArrow, //TODO:
                );
              } else {
                List<SchoolYearNewStudentRegistrationModel> students = snapshot
                    .data as List<SchoolYearNewStudentRegistrationModel>;
                return ListView.separated(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return NewStudentSelectionCard(
                      student: students[index],
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
                    'طلاب جدد للمرحلة الدراسية المختارةطلاب جدد للمرحلة الدراسية المختارة',
                iconData: FontAwesomeIcons.locationArrow, //TODO:
              );
            }
          },
        ),
      ),
    );
  }
}
