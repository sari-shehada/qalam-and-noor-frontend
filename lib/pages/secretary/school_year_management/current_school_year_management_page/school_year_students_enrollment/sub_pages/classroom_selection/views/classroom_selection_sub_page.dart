import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/classroom_selection/controllers/classroom_selection_sub_page_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/classroom_selection/views/widgets/classroom_selection_card.dart';

import '../../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../../../../tools/widgets/error_loading_something_widget.dart';

class ClassroomSelectionPage
    extends GetView<ClassroomSelectionSubPageController> {
  const ClassroomSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Obx(
        () => FutureBuilder<List<Classroom>>(
          future: controller.classrooms.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return ErrorLoadingSomethingWidget(
                somethingName: 'الشعب',
                retryCallback: () => controller.reloadClassrooms(),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const EmptyItemWidget(
                  itemName: 'شعب ضمن المرحلة الدراسية المختارة',
                  iconData: FontAwesomeIcons.locationArrow, //TODO:
                );
              } else {
                List<Classroom> classrooms = snapshot.data as List<Classroom>;
                return ListView.separated(
                  itemCount: classrooms.length,
                  itemBuilder: (context, index) {
                    List<Color> backgroundColors = [
                      Get.theme.scaffoldBackgroundColor.withOpacity(.7),
                      Colors.white,
                    ];
                    return ClassroomSelectionCard(
                      classroom: classrooms[index],
                      backgroundColor: backgroundColors[index % 2],
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
                itemName: 'شعب ضمن المرحلة الدراسية المختارة',
                iconData: FontAwesomeIcons.locationArrow, //TODO:
              );
            }
          },
        ),
      ),
    );
  }
}
