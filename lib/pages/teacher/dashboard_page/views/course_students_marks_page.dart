import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';

class CourseStudentsMarks extends StatelessWidget {
  const CourseStudentsMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(
        backButtonEnabled: true,
        title: "marks",
        iconData: FontAwesomeIcons.a,
      ),
    );
  }
}
