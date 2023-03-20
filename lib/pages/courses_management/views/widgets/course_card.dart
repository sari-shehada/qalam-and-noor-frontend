//this widget is a container for a course with edit and delete buttons
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../configs/fonts.dart';
import '../../../../configs/project_themes.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    required this.courseName,
    super.key,
  });
  final String courseName;
  @override
  Widget build(BuildContext context) {
    //TODO : replace padding with margin
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          padding: const EdgeInsets.all(10),
          height: 70,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.indigo, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Text(
                courseName,
                style: ProjectFonts.titleMedium.copyWith(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.pen,
                    color: Colors.white,
                  )),
              const AddHorizontalSpacing(value: 5),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.trashCan,
                    color: Colors.white,
                  )),
            ],
          )),
    );
  }
}
