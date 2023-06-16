import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/current_school_year_management_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/semesters_in_school_year_widget.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_registration/main_page/views/register_new_students_in_school_year_dialog.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/labeled_widget.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: SemestersInSchoolYearWidget(),
              ),
              AddVerticalSpacing(value: 15.h),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      GlobalStyles.globalBorderRadius,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 20.h,
                  ),
                  child: LabeledWidget(
                    label: 'الشعب الحالية ضمن العام الدراسي',
                    labelTextStyle: ProjectFonts.headlineMedium(),
                    spacing: 35.h,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('asd'),
                            ],
                          ),
                        ),
                        AddHorizontalSpacing(value: 20.w),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CustomFilledButton(
                                onTap: () =>
                                    controller.manageClassroomsInSchoolYear(),
                                child: 'فتح شعب جديدة ضمن العام الدراسي',
                              ),
                              CustomFilledButton(
                                onTap: () {},
                                child:
                                    'اغلاق شعب مفتوحة مسبقا في العام الدراسي',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomFilledButton(
                onTap: () =>
                    Get.dialog(const RegisterNewStudentsInSchoolYearDialog()),
                child: 'reg new students',
              ),
              const Expanded(
                flex: 6,
                child: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
