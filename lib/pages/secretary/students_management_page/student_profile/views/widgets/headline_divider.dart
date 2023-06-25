import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../configs/styles.dart';

class HeadlineDivider extends StatelessWidget {
  const HeadlineDivider({super.key, required this.header});
  final String header;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.25),
        borderRadius: BorderRadius.all(
          Radius.circular(
            GlobalStyles.globalBorderRadius,
          ),
        ),
      ),
      padding: EdgeInsets.all(10.w),
      child: Center(
        child: Text(
          header,
          style: ProjectFonts.headlineSmall().copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
