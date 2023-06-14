import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../models/educational/classroom.dart';

import '../../controllers/school_class_details_controller.dart';

class ClassroomRow extends StatelessWidget {
  const ClassroomRow(
      {super.key, required this.classroom, required this.rowColor});
  final Classroom classroom;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    SchoolClassDetailsController controller = Get.find();
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  alignment: Alignment.centerRight,
                  child: Text(
                    classroom.name,
                    style: textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${classroom.maxCapacity.toString()} طالب',
                    style: textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: IconButton(
                    onPressed: () => controller.updateClassroomInfo(classroom),
                    icon: Icon(
                      Icons.edit,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
