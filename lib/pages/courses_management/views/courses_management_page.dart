import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/course_card.dart';
import 'widgets/course_division.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class CoursesManagementPage extends StatelessWidget {
  const CoursesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.withOpacity(.6),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AddHorizontalSpacing(value: 15.w),
                    Container(
                      width: 200.w,
                      height: 90.h,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: DropdownButton(
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          iconEnabledColor: Colors.white,
                          focusColor: Colors.transparent,
                          hint: Text(
                            "  اختر الصف من هنا",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                          items: [
                            "الأول",
                            "الثاني",
                            "الثالث",
                            "الرابع",
                            "الخامس",
                            "السادس",
                            "السابع",
                            "الثامن",
                            "التاسع"
                          ]
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text("الصف $e"),
                                  ))
                              .toList(),
                          onChanged: (word) {}),
                    ),
                  ],
                ),
                AddVerticalSpacing(value: 20.h),
                const CoursesDivision(
                  subjectsType: "المواد الإجبارية",
                  courses: [
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                  ],
                ),
                AddVerticalSpacing(value: 20.h),
                const CoursesDivision(
                  subjectsType: "المواد الإثرائية",
                  courses: [
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
