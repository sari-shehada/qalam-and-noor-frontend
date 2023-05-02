import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../configs/assets.dart';
import '../controllers/loader_controller.dart';
import '../../../tools/ui_tools/ui_tools.dart';

import '../../../configs/fonts.dart';

class LoaderPage extends StatefulWidget {
  const LoaderPage({super.key});

  @override
  State<LoaderPage> createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      LoaderController loaderController = Get.find();
      await loaderController.loadApplication();
      loaderController.dispose();
    });
    return Scaffold(
      backgroundColor: const Color(0xffE1EAF4),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              GlobalAssets.appLogoPath,
              height: 310.h,
              width: 310.h,
              fit: BoxFit.cover,
            ),
            AddVerticalSpacing(value: 170.h),
            Text(
              'قلم و نور',
              //TODO:
              style: ProjectFonts.headlineMedium().copyWith(fontSize: 50.sp),
            ),
          ],
        ),
      ),
    );
  }
}
