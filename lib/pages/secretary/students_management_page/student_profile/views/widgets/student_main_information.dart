import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../../shared/account_settings_page/views/widgets/profile_info_widget.dart';
import '../../controllers/student_profile_controller.dart';

class MainInfo extends GetView<StudentProfileController> {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      margin: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "البيانات الاساسية",
            style: ProjectFonts.headlineSmall().copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          _buildGenderContainer(
            colorScheme,
            isMale: controller.student.value.isMale,
          ),
          IconLabelItem(
            iconData: FontAwesomeIcons.cakeCandles,
            label: DateTimeHelper.getDateWithoutTime(
              controller.student.value.dateOfBirth,
            ),
            toolTip: "تاريخ الميلاد",
          ),
          IconLabelItem(
            iconData: FontAwesomeIcons.phoneFlip,
            label: controller.student.value.landLine,
            toolTip: "رقم الهاتف الأرضي",
          ),
          IconLabelItem(
            iconData: FontAwesomeIcons.whatsapp,
            label: controller.student.value.whatsappPhoneNumber,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Container _buildGenderContainer(ColorScheme colorScheme,
      {required bool isMale}) {
    return Container(
      height: 50.h,
      width: 140.w,
      padding: EdgeInsets.only(left: 10.w, bottom: 5.h, right: 5.w, top: 5.h),
      decoration: BoxDecoration(
        color: isMale ? colorScheme.primary : Colors.pink[300],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            isMale ? Icons.male : Icons.female,
            color: Colors.white,
            size: 32.sp,
          ),
          Text(
            isMale ? 'ذكر' : 'انثى',
            style: ProjectFonts.headlineSmall().copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
