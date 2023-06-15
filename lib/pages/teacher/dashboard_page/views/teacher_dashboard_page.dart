import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/views/widgets/course_info_table.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/widgets/employee_dashboard_profile_widget.dart';
import '../controllers/teacher_dashboard_controller.dart';

class TeacherDashboardPage extends StatelessWidget {
  const TeacherDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    TeacherDashboardControllerController controller = Get.put(
      TeacherDashboardControllerController(),
    );
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'الرئيسية',
        iconData: FontAwesomeIcons.house,
        actionButton: EmployeeDashboardProfileWidget(),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: 50.h,
            start: 40.w,
            end: 40.w,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'المقررات الحالية',
                  style: ProjectFonts.headlineMedium(),
                ),
              ),
              Expanded(
                flex: 7,
                child: FutureBuilder(
                  future: controller.getAllTeacherCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: LoaderWidget(),
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return const EmptyItemWidget(
                          itemName: 'مقررات', iconData: FontAwesomeIcons.book);
                    }
                    return CourseInfoTable(coursesInfo: snapshot.data!);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
