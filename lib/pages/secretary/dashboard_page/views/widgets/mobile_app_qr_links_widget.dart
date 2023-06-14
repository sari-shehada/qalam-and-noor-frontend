import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MobileAppLinksWidget extends StatelessWidget {
  const MobileAppLinksWidget({
    super.key,
    required this.androidLink,
    required this.iosLink,
  });

  final String androidLink;
  final String iosLink;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImageView(
                    data: androidLink,
                    version: QrVersions.auto,
                    gapless: false,
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Text(
                    'رابط تطبيق الأهل لأجهزة الأندرويد',
                    textAlign: TextAlign.center,
                    style: ProjectFonts.titleLarge().copyWith(
                      color: Get.theme.colorScheme.primary.withOpacity(1),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 35.w),
              width: 3.w,
              decoration:
                  BoxDecoration(color: Get.theme.colorScheme.onSurfaceVariant),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImageView(
                    data: androidLink,
                    version: QrVersions.auto,
                    gapless: false,
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Text(
                    'رابط تطبيق الأهل لأجهزة ال iOS',
                    textAlign: TextAlign.center,
                    style: ProjectFonts.titleLarge().copyWith(
                      color: Get.theme.colorScheme.primary.withOpacity(1),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
