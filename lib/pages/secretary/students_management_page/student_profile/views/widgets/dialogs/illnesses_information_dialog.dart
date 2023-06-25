import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../../../models/student_illness_info.dart';

class IllnessesInfoDialog extends StatelessWidget {
  const IllnessesInfoDialog({super.key, required this.list});
  final List<StudentIllnessInfo> list;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          width: 600.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.transparent,
          ),
          padding: EdgeInsetsDirectional.only(
              start: 30.w, end: 30.w, top: 20.h, bottom: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'يعاني الطالب من الأمراض التالية',
                    style: ProjectFonts.headlineMedium(),
                  ),
                  AddHorizontalSpacing(value: 30.w),
                  FaIcon(
                    FontAwesomeIcons.virus,
                    color: colorScheme.primary,
                  ),
                ],
              ),
              AddVerticalSpacing(value: 30.h),
              SizedBox(
                height: 350.h,
                width: 400.w,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10.h),
                      margin: EdgeInsets.only(
                        bottom: 15.h,
                        left: 10.w,
                        right: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10.h),
                            blurRadius: 12,
                            color: colorScheme.primary.withOpacity(.09),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            list[index].illnessName,
                            style: ProjectFonts.headlineSmall(),
                          ),
                          AddVerticalSpacing(value: 15.h),
                          Text(
                            list[index].note ?? "لايوجد ملاحظات",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
