import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/custom_appbar.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class SchoolYearManagementPage extends StatelessWidget {
  const SchoolYearManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'إدارة العام الدراسي',
        iconData: FontAwesomeIcons.school,
        actionButton: CustomAppBarActionButton(
          label: 'بدء عام دراسي جديد',
          onTap: () {},
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 50.h,
              start: 60.w,
              end: 60.w,
            ),
            child: Center(
              child: Text('sss'),
            )),
      ),
    );
  }
}
