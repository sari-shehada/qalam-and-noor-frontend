import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';

class NewStudentRegistrationPage extends StatelessWidget {
  const NewStudentRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    final BoxDecoration backContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10.h),
          blurRadius: 10,
          color: colorScheme.shadow.withOpacity(.02),
        )
      ],
    );
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تسجيل طالب جديد',
        iconData: FontAwesomeIcons.userPlus,
        backButtonEnabled: true,
      ),
      body: SizedBox.expand(
        child: Center(
            child: Container(
          width: 1000.w,
          margin: EdgeInsets.only(bottom: 60.h, top: 30.h),
          decoration: backContainerDecoration,
        )),
      ),
    );
  }
}
