import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/student_fill_psychological_statuses_page/main_page/views/widgets/student_fill_psychological_status_card.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

import '../controllers/student_fill_psychological_statuses_controller.dart';

class StudentFillPsychologicalStatusesPage extends StatelessWidget {
  const StudentFillPsychologicalStatusesPage({super.key});

  @override
  Widget build(BuildContext context) {
    StudentFillPsychologicalStatusesController controller = Get.put(
      StudentFillPsychologicalStatusesController(),
    );
    return CustomScaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: 'تسجيل حالات الطلاب الجدد',
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 400.w,
                    child: Row(
                      children: [
                        Text(
                          'عرض:',
                          style: ProjectFonts.titleLarge(),
                        ),
                        AddHorizontalSpacing(value: 30.w),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                GlobalStyles.globalBorderRadius,
                              ),
                              color: Get.theme.colorScheme.primaryContainer,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 2.h,
                              horizontal: 20.w,
                            ),
                            child: DropdownButton<String>(
                              value: 'جميع الطلاب',
                              onChanged: (value) => {},
                              borderRadius: BorderRadius.circular(14.r),
                              elevation: 5,
                              dropdownColor:
                                  Get.theme.colorScheme.primaryContainer,
                              style: TextStyle(
                                fontFamily: ProjectFonts.fontFamily,
                                fontSize: 24.sp,
                                color: Get.theme.colorScheme.primary,
                              ),
                              isExpanded: true,
                              // icon: const SizedBox.shrink(),
                              underline: const SizedBox.shrink(),
                              items: ['جميع الطلاب', 'الاناث', 'الذكور']
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: 30.w,
                                        ),
                                        child: Text(e),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: controller.numberOfRemainingStudents.value == 0
                          ? 0
                          : 1,
                      duration: 400.milliseconds,
                      child: Text(
                        '${controller.numberOfRemainingStudents.value}  طلاب متبقية',
                        style: ProjectFonts.headlineMedium(),
                      ),
                    ),
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
                              return StudentFillPsychologicalStatusCard(
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
        ));
  }
}


//TODO: add display options as well as sorting options