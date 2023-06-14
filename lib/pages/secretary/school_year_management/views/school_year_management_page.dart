import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/school_year_management_controller.dart';
import 'widgets/current_school_year_card.dart';

import '../../../../tools/ui_tools/custom_appbar.dart';

class SchoolYearManagementPage extends StatelessWidget {
  const SchoolYearManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      SchoolYearManagementController(),
    );
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
            start: 40.w,
            end: 40.w,
          ),
          child: const Column(
            children: [
              Expanded(
                flex: 3,
                child: CurrentSchoolYearCard(),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
