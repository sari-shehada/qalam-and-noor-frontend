import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class CoursesManagmentPage extends StatelessWidget {
  const CoursesManagmentPage({super.key});

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
                  AddHorizontalSpacing(value: 100),
                  DropdownButton(items: [
                    DropdownMenuItem(
                      child: Text("first"),
                    ),
                  ], onChanged: (String) {}),
                ],
              ),
              CoursesContainer(
                subjectsType: "المواد الاجبارية",
                courses: [CourseCard(courseName: "رياضيات")],
              ),
              CoursesContainer(
                subjectsType: "المواد الاثرائية",
                courses: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//this is a container for courses
class CoursesContainer extends StatelessWidget {
  const CoursesContainer({
    super.key,
    required this.subjectsType,
    required this.courses,
  });
  final String subjectsType;
  final List<CourseCard> courses;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 280,
      decoration: BoxDecoration(
          color: lightColorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(30)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$subjectsType :",
              style: ProjectFonts.titleLarge,
            ),
            IconButton(
                onPressed: () {}, icon: Icon(FontAwesomeIcons.circlePlus)),
          ],
        ),
        ListView.builder(itemBuilder: itemBuilder)
      ]),
    );
  }
}

//this widget is a container for a course with edit and delete buttons
class CourseCard extends StatelessWidget {
  const CourseCard({
    required this.courseName,
    super.key,
  });
  final String courseName;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 70,
        width: 400,
        decoration: BoxDecoration(
            color: lightColorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Text(
              courseName,
              style: ProjectFonts.titleMedium,
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.pen)),
            const AddHorizontalSpacing(value: 5),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.trashCan)),
          ],
        ));
  }
}
