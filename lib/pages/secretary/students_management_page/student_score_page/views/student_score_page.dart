import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:collection/collection.dart';
import '../../../../../tools/ui_tools/custom_appbar.dart';
import '../controllers/student_score_controller.dart';
import 'dart:math' as math;

class StudentScorePage extends GetView<StudentScoreController> {
  const StudentScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "الجلاء الخاص بالطالب: ${controller.student.firstName}",
        iconData: FontAwesomeIcons.child,
        backButtonEnabled: true,
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  if (controller.isLoadingSemesters.value) {
                    return const SizedBox.shrink();
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.semesters.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        bool isSelected =
                            controller.selectedIndex.value == index;
                        return Padding(
                          padding: EdgeInsets.only(right: 60.w, bottom: 0),
                          child: InkWell(
                            onTap: () async {
                              await controller.getStudentScores(
                                  semesterId: controller.semesters[index].id);
                              controller.selectedIndex.value = index;
                            },
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                GlobalStyles.globalBorderRadius,
                              ),
                              topRight: Radius.circular(
                                GlobalStyles.globalBorderRadius,
                              ),
                            ),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    GlobalStyles.globalBorderRadius,
                                  ),
                                  topRight: Radius.circular(
                                    GlobalStyles.globalBorderRadius,
                                  ),
                                ),
                              ),
                              height: double.infinity,
                              width: 200.w,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.semesters[index].name,
                                      style: ProjectFonts.titleLarge().copyWith(
                                        color: isSelected ? Colors.white : null,
                                      ),
                                    ),
                                    Text(
                                      controller.schoolYear.name,
                                      style: ProjectFonts.titleLarge().copyWith(
                                        color: isSelected ? Colors.white : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 14,
              child: Obx(() {
                if (controller.isLoadingSemesters.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.selectedIndex.value != -1) {
                  return SizedBox.expand(
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: SizedBox.expand(
                        child: Container(
                          padding: EdgeInsets.all(20.h),
                          margin: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                            //TODO: Play with opacity
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                GlobalStyles.globalBorderRadius,
                              ),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 100.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox.expand(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(.8),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                      GlobalStyles
                                                          .globalBorderRadius,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Transform.rotate(
                                              angle: -(math.pi / 5.5),
                                              child: Container(
                                                color: Colors.white,
                                                height: 1,
                                                width: 400.w,
                                              ),
                                            ),
                                            Positioned(
                                              left: 10.w,
                                              top: 10.h,
                                              child: Text(
                                                "نوع الامتحان",
                                                style:
                                                    ProjectFonts.titleMedium()
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                              ),
                                            ),
                                            Positioned(
                                              right: 10.w,
                                              bottom: 10.h,
                                              child: Text(
                                                "اسم المقرر",
                                                style:
                                                    ProjectFonts.titleMedium()
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                              ExamType.values.length,
                                              (index) => Expanded(
                                                child: Container(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(.8),
                                                  child: Center(
                                                    child: Text(
                                                      getExamNameFromExamTypeEnum(
                                                        ExamType.values[index],
                                                      ),
                                                      style: ProjectFonts
                                                              .titleMedium()
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(.8),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'العلامة الكلية',
                                                    style: ProjectFonts
                                                            .titleMedium()
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(.8),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'النسبة المئوية',
                                                    style: ProjectFonts
                                                            .titleMedium()
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(.8),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                      GlobalStyles
                                                          .globalBorderRadius,
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'المجموع',
                                                    style: ProjectFonts
                                                            .titleMedium()
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ...List.generate(
                                  controller
                                      .currentSemesterStudentScores.length,
                                  (index) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: 60.h,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 60.h,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                          .withOpacity(.8),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(
                                                          index ==
                                                                  (controller
                                                                          .currentSemesterStudentScores
                                                                          .length -
                                                                      1)
                                                              ? GlobalStyles
                                                                  .globalBorderRadius
                                                              : 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ...List.generate(
                                                  ExamType.values.length,
                                                  (enumVal) => Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        controller
                                                            .currentSemesterStudentScores[
                                                                index]
                                                            .grades[
                                                                ExamType.values[
                                                                    enumVal]]
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      controller
                                                          .currentSemesterStudentScores[
                                                              index]
                                                          .totalGrade
                                                          .toString(),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                        "${(controller.currentSemesterStudentScores[index].grades.values.sum / controller.currentSemesterStudentScores[index].totalGrade) * 100}%"),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      "${controller.currentSemesterStudentScores[index].grades.values.sum}",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 100.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: SizedBox(),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.green,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.pink,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 80.w),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 34.sp,
                                  ),
                                  AddVerticalSpacing(value: 10.h),
                                  Text(
                                    'يرجى اختيار فصل',
                                    style: ProjectFonts.titleLarge()
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 400.h,
                          width: 700.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                GlobalStyles.globalBorderRadius,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cancel,
                                size: 100.sp,
                              ),
                              AddVerticalSpacing(value: 20.h),
                              Text(
                                'لم يتم تحديد أي فصل',
                                style: ProjectFonts.headlineMedium()
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  String getExamNameFromExamTypeEnum(ExamType value) {
    switch (value) {
      case ExamType.verbal:
        return 'شفهي';
      case ExamType.homework:
        return 'الوظائف';
      case ExamType.activity:
        return 'النشاطات';
      case ExamType.firstExam:
        return 'الامتحان الاول';
      case ExamType.secondExam:
        return 'الامتحان الثاني';
      case ExamType.finalExam:
        return 'الامتحان النهائي';
      default:
        return '';
    }
  }
}
