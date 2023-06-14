import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';

import '../../../../../../models/educational/school_year.dart';

class SchoolYearRow extends StatelessWidget {
  const SchoolYearRow({
    super.key,
    required this.schoolYear,
    required this.rowColor,
  });

  final SchoolYear schoolYear;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      schoolYear.name,
                      style: ProjectFonts.titleMedium()
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Get.theme.colorScheme.primary.withOpacity(.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
