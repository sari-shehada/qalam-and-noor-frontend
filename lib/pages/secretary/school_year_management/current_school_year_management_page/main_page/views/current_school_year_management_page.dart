import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/current_school_year_options.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/current_school_year_school_classes_count_widget.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/current_school_year_school_classrooms_count_widget.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/current_semester_widget.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/sub_widgets/current_school_year_shimmer_container.dart';

import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/current_school_year_management_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/current_school_year_students_count_widget.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class CurrentSchoolYearManagementPage
    extends GetView<CurrentSchoolYearManagementController> {
  const CurrentSchoolYearManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'العام الدراسي : ${controller.schoolYear.name}',
        iconData: FontAwesomeIcons.school,
        backButtonEnabled: true,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
          child: Row(
            children: [
              Expanded(
                flex: 75,
                child: Column(
                  children: [
                    const Expanded(
                      flex: 50,
                      child: CurrentSemesterWidget(),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    const Expanded(
                      flex: 50,
                      child: CurrentSchoolYearOptions(),
                    ),
                  ],
                ),
              ),
              AddHorizontalSpacing(value: 30.w),
              const Expanded(
                flex: 30,
                child: LeftSideContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftSideContainer extends StatelessWidget {
  const LeftSideContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CurrentSchoolYearShimmerContainer(
            buildChildWithContainer: true,
            child: Column(
              children: [
                const Expanded(
                  flex: 4,
                  child: CurrentSchoolYearStudentsCountWidget(),
                ),
                Divider(
                  indent: 30.w,
                  endIndent: 30.w,
                ),
                const Expanded(
                  flex: 3,
                  child: CurrentSchoolYearSchoolClassesCountWidget(),
                ),
                Divider(
                  indent: 30.w,
                  endIndent: 30.w,
                ),
                const Expanded(
                  flex: 3,
                  child: CurrentSchoolYearClassroomsCountWidget(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Column(
//             children: [
//               const Expanded(
//                 flex: 2,
//                 child: SemestersInSchoolYearWidget(),
//               ),
//               AddVerticalSpacing(value: 15.h),
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(
//                       GlobalStyles.globalBorderRadius,
//                     ),
//                   ),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 30.w,
//                     vertical: 20.h,
//                   ),
//                   child: LabeledWidget(
//                     label: 'الشعب الحالية ضمن العام الدراسي',
//                     labelTextStyle: ProjectFonts.headlineMedium(),
//                     spacing: 35.h,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 7,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('asd'),
//                             ],
//                           ),
//                         ),
//                         AddHorizontalSpacing(value: 20.w),
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               CustomFilledButton(
//                                 onTap: () =>
//                                     controller.manageClassroomsInSchoolYear(),
//                                 child: 'فتح شعب جديدة ضمن العام الدراسي',
//                               ),
//                               CustomFilledButton(
//                                 onTap: () {},
//                                 child:
//                                     'اغلاق شعب مفتوحة مسبقا في العام الدراسي',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               CustomFilledButton(
//                 onTap: () => controller.enrollNewStudentsToSchoolYear(),
//                 child: 'reg new students',
//               ),
//               const Expanded(
//                 flex: 6,
//                 child: SizedBox(),
//               )
//             ],
//           ),
