import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/models/educational/classroom.dart';

import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/school_class_details_controller.dart';

class ClassroomCard extends StatelessWidget {
  const ClassroomCard({super.key, required this.classroom});
  final Classroom classroom;
  @override
  Widget build(BuildContext context) {
    SchoolClassDetailsController controller = Get.find();
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      builder: (context, opacity, _) {
        return Opacity(
          opacity: opacity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 0.h,
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 2.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blueGrey.withOpacity(.7),
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
              ),
              child: Row(children: [
                AddHorizontalSpacing(value: 15.w),
                Text(
                  classroom.name,
                  style: TextStyle(
                    fontSize: 22.sp,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(GlobalStyles.globalBorderRadius),
                    color: GlobalStyles.miscColors[2],
                  ),
                  child: Row(
                    children: [
                      Text('السعة الكلية'),
                      AddHorizontalSpacing(value: 10.w),
                      Text(
                        '${classroom.maxCapacity.toString()} طالب',
                        style: ProjectFonts.labelLarge().copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                AddHorizontalSpacing(value: 10.w),
                IconButton(
                  onPressed: () => controller.updateClassroomInfo(classroom),
                  icon: Icon(
                    Icons.edit,
                    color: Get.theme.colorScheme.primary.withOpacity(.7),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
