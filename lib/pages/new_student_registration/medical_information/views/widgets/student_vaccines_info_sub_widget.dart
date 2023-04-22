import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentVaccinesInfoSubWidget extends StatelessWidget {
  const StudentVaccinesInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      shrinkWrap: true,
      children: [
        Text('Student Vaccines'),
      ],
    );
  }
}
