import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../models/address/address.dart';
import '../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/settings_page_controller.dart';

class ProfileAddress extends StatelessWidget {
  const ProfileAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();

    return Container(
      padding: EdgeInsets.all(30.w),
      margin: EdgeInsets.all(20.w),
      width: 410.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "العنوان",
            style: ProjectFonts.headlineMedium(),
          ),
          AddVerticalSpacing(value: 20.h),
          FutureBuilder<Address?>(
            future: controller.getAddress(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  child: const LoaderWidget(),
                );
              }
              return Column(
                children: [
                  Text(
                    snapshot.data!.name,
                    style: ProjectFonts.headlineSmall().copyWith(
                        color: Get.theme.colorScheme.onSurfaceVariant),
                  ),
                  AddVerticalSpacing(value: 30.h),
                  Text(
                    snapshot.data!.details!,
                    style: ProjectFonts.headlineSmall().copyWith(
                        color: Get.theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
