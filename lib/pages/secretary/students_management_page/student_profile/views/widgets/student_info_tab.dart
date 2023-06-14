import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../controllers/student_profile_controller.dart';

class StudentInfoTab extends GetView<StudentProfileController> {
  const StudentInfoTab({
    required this.title,
    this.children = const [],
    super.key,
    this.isListViewBased = false,
  });
  final List<Widget> children;
  final String title;
  final bool isListViewBased;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.w, bottom: 10.w),
      margin: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Text(
            title,
            style: ProjectFonts.headlineSmall().copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!isListViewBased) const Spacer(),
          ...children,
          if (!isListViewBased) const Spacer(),
        ],
      ),
    );
  }
}
