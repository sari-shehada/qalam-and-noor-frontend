import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/loader/controllers/loader_page_animation_controller.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import '../../../configs/assets.dart';
import '../controllers/loader_controller.dart';

import '../../../configs/fonts.dart';

class LoaderPage extends StatefulWidget {
  const LoaderPage({super.key});

  @override
  State<LoaderPage> createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {
  @override
  Widget build(BuildContext context) {
    LoaderPageAnimationController animationController = Get.put(
      LoaderPageAnimationController(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      LoaderController loaderController = Get.find();
      await loaderController.loadApplication();
      loaderController.dispose();
    });
    return Scaffold(
      backgroundColor: const Color(0xffE1EAF4),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController.logoAnimation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                top: animationController.logoAnimation.value,
                height: 310.h,
                width: 310.h,
                child: Image.asset(
                  GlobalAssets.appLogoPath,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController.textAnimation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                top: animationController.textAnimation.value,
                child: Text(
                  'قلم و نور',
                  //TODO:
                  style:
                      ProjectFonts.headlineMedium().copyWith(fontSize: 50.sp),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController.userInfoAnimationController,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                top: 250.h,
                width: 400.w,
                child: Opacity(
                  opacity: animationController.userInfoAnimation.value,
                  child: animationController.employee.value == null
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            Image.asset(
                              animationController.employee.value!
                                  .getAvatarImage(circular: true),
                              height: 250.w,
                              width: 250.w,
                            ),
                            AddVerticalSpacing(value: 40.h),
                            Text(
                              'مرحباً',
                              style: ProjectFonts.headlineMedium().copyWith(
                                color: Get.theme.colorScheme.onSurface,
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            Text(
                              animationController.employee.value!.firstName,
                              style: ProjectFonts.headlineLarge(),
                            ),
                          ],
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
