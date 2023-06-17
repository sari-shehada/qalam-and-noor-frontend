import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/views/widgets/student_enrollment_selection_card.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/new_students_selection/models/new_student_enrollment_model.dart';

import '../../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../controllers/school_year_new_students_enrollment_sub_page_controller.dart';

class SchoolYearNewStudentsEnrollmentSubPage
    extends GetView<SchoolYearNewStudentsEnrollmentSubPageController> {
  const SchoolYearNewStudentsEnrollmentSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Obx(
        () => FutureBuilder<List<NewStudentEnrollmentModel>>(
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
                List<Color> backgroundColors = [
                  Get.theme.scaffoldBackgroundColor.withOpacity(.7),
                  Colors.white,
                ];
                List<NewStudentEnrollmentModel> students =
                    snapshot.data as List<NewStudentEnrollmentModel>;
                return ListView.separated(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final NewStudentEnrollmentModel newStudentEnrollmentModel =
                        students[index];
                    return Obx(
                      () => StudentEnrollmentSelectionCard(
                        student: newStudentEnrollmentModel.student,
                        isSelected: controller.selectedStudents
                            .contains(newStudentEnrollmentModel),
                        toggleCallBack: () =>
                            controller.toggleStudent(newStudentEnrollmentModel),
                        backgroundColor: backgroundColors[index % 2],
                      ),
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
                itemName: 'طلاب جدد للمرحلة الدراسية المختارة',
                iconData: FontAwesomeIcons.locationArrow, //TODO:
              );
            }
          },
        ),
      ),
    );
  }
}
