import 'package:flutter/material.dart';
import 'package:kalam_noor/pages/courses_management/views/widgets/course_card.dart';
import 'package:kalam_noor/pages/courses_management/views/widgets/course_division.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class CoursesManagementPage extends StatelessWidget {
  const CoursesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const AddHorizontalSpacing(value: 100),
                  DropdownButton(items: const [
                    DropdownMenuItem(
                      child: Text("first"),
                    ),
                  ], onChanged: (word) {}),
                ],
              ),
              const CoursesDivision(
                subjectsType: "المواد الإجبارية",
                courses: [
                  CourseCard(courseName: "رياضيات"),
                  CourseCard(courseName: "رياضيات"),
                  CourseCard(courseName: "رياضيات"),
                  CourseCard(courseName: "رياضيات"),
                ],
              ),
              const CoursesDivision(
                subjectsType: "المواد الإثرائية",
                courses: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
