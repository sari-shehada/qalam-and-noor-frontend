import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/ui_tools.dart';
import '../../navigation_page/views/widgets/cross_switcher.dart';
import '../controllers/logic_controller.dart';
import '../controllers/ui_controller.dart';

class RegisterNewStudentDialog extends StatelessWidget {
  const RegisterNewStudentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterNewStudentLogicController logicController = Get.put(
      RegisterNewStudentLogicController(),
    );
    RegisterNewStudentUIController uiController =
        Get.put(RegisterNewStudentUIController());
    return Center(
      child: Container(
        width: 1200.w,
        height: 850.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        clipBehavior: Clip.hardEdge,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 80.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.06),
                    offset: Offset(0, 5.h),
                    blurRadius: 60,
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: logicController.registerButtonStatus.value ==
                                CallToActionButtonStatus.enabled
                            ? () => Get.back()
                            : () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.x,
                        ),
                      ),
                    ),
                    AddHorizontalSpacing(value: 30.w),
                    Text(
                      'تسجيل طالب جديد',
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SizedBox.expand(
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => FadeIndexedStack(
                      // controller: uiController.pageController,
                      // scrollDirection: Axis.horizontal,
                      index: uiController.currentPageIndex.value,
                      children: uiController.pages,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        offset: Offset(0, -5.h),
                        blurRadius: 60,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  height: 90.h,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CallToActionButton(
                          onTap: () => uiController.previousPage(),
                          child: 'السابق',
                          backgroundColor:
                              Get.theme.colorScheme.primaryContainer,
                          useShadow: false,
                          labelColor: Get.theme.colorScheme.primary,
                        ),
                      ),
                      AddHorizontalSpacing(value: 40.w),
                      Expanded(
                        flex: 2,
                        child: Obx(
                          () => uiController.isLastPageReached.value == true
                              ? CallToActionButton(
                                  onTap: () =>
                                      logicController.registerStudent(),
                                  child: 'تسجيل الطالب',
                                  buttonStatus:
                                      logicController.registerButtonStatus,
                                )
                              : CallToActionButton(
                                  onTap: () => uiController.nextPage(),
                                  child: 'التالي',
                                ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
