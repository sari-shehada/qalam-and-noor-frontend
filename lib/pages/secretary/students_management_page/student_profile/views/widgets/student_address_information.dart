import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/student_profile_controller.dart';

class StudentAddressInformation extends GetView<StudentProfileController> {
  const StudentAddressInformation({super.key});

  @override
  Widget build(BuildContext context) {
    String? addressDetails = controller.studentAddressInfo.address.details;
    if (controller.studentAddressInfo.address.details == null ||
        controller.studentAddressInfo.address.details == "" ||
        controller.studentAddressInfo.address.details == "-") {
      addressDetails = null;
    }
    return Container(
      margin: EdgeInsets.all(10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "يسكن في ",
            style: ProjectFonts.headlineSmall().copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StudentProfileAddressInfoSubCard(
                title: controller.studentAddressInfo.city.name,
                iconData: FontAwesomeIcons.city,
              ),
              const Icon(Icons.chevron_right),
              StudentProfileAddressInfoSubCard(
                title: controller.studentAddressInfo.area.name,
                iconData: FontAwesomeIcons.treeCity,
              ),
              const Icon(Icons.chevron_right),
              StudentProfileAddressInfoSubCard(
                title: controller.studentAddressInfo.address.name,
                iconData: FontAwesomeIcons.road,
                details: addressDetails,
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class StudentProfileAddressInfoSubCard extends StatelessWidget {
  const StudentProfileAddressInfoSubCard({
    super.key,
    required this.title,
    required this.iconData,
    this.details,
  });

  final String title;
  final IconData iconData;
  final String? details;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: details != null && details != '-' ? details : title,
        child: Column(
          children: [
            FaIcon(
              iconData,
              color: Get.theme.colorScheme.primary,
              size: 50.sp,
            ),
            AddVerticalSpacing(value: 30.h),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ProjectFonts.headlineSmall().copyWith(
                color: Get.theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
