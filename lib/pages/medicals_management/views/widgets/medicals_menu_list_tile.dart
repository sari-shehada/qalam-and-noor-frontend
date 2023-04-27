import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MedicalsMenuListTile extends StatelessWidget {
  const MedicalsMenuListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.iconData,
      required this.onTap});

  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: FaIcon(
            iconData,
            size: 35.sp,
            color: Get.theme.colorScheme.primary,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 34.sp,
              color: Get.theme.colorScheme.primary,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              //TODO:
              subtitle,
              style: TextStyle(
                fontSize: 25.sp,
                //TODO: Change
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
