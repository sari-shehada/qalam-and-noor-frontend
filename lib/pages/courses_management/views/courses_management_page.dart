import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const AddHorizontalSpacing(value: 15),
                    Container(
                      width: 180,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(30)),
                      child: DropdownButton(
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          iconEnabledColor: Colors.white,
                          focusColor: Colors.transparent,
                          hint: const Text(
                            "  اختر الصف من هنا",
                            style: TextStyle(color: Colors.white),
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
                const AddVerticalSpacing(value: 20),
                const CoursesDivision(
                  subjectsType: "المواد الإجبارية",
                  courses: [
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                    CourseCard(courseName: "رياضيات"),
                  ],
                ),
                const AddVerticalSpacing(value: 20),
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
