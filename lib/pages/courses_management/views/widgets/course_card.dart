//this widget is a container for a course with edit and delete buttons
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../configs/fonts.dart';
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
      padding: EdgeInsets.all(10.w),
      child: Container(
          padding: EdgeInsets.all(10.w),
          height: 70.h,
          width: 400.w,
          decoration: BoxDecoration(
              color: Colors.indigo, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Text(
                courseName,
                style: ProjectFonts.titleMedium().copyWith(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.pen,
                    color: Colors.white,
                  )),
              AddHorizontalSpacing(value: 5.w),
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
