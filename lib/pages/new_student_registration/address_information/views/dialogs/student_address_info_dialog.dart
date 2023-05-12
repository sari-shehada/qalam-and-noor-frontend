import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/student_address_info_dialog_controller.dart';

class StudentAddressInfoDialog extends StatelessWidget {
  const StudentAddressInfoDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StudentAddressInfoDialogController controller =
        Get.put(StudentAddressInfoDialogController());
    return Center(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: Obx(
          () => AnimatedContainer(
            width: 700.w,
            height: controller.containerHeight.value,
            duration:
                StudentAddressInfoDialogControllerConstants.animationDuration,
            curve: StudentAddressInfoDialogControllerConstants.animationCurve,
            padding: EdgeInsets.only(
              top: 20.h,
              left: 25.w,
              right: 25.w,
              bottom: 20.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
            ),
            child: Column(
              children: [
                Text(
                  'العنوان',
                  style: ProjectFonts.headlineMedium(),
                ),
                AddVerticalSpacing(value: 25.h),
                Obx(
                  () => Opacity(
                    opacity: controller.isProcessing.value == true ? 1.0 : 0.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: const LinearProgressIndicator(),
                    ),
                  ),
                ),
                AddVerticalSpacing(value: 25.h),
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Obx(
                        () => AnimatedOpacity(
                          duration: StudentAddressInfoDialogControllerConstants
                              .animationDuration,
                          curve: StudentAddressInfoDialogControllerConstants
                              .animationCurve,
                          opacity:
                              controller.cityDropDownButtonEnabled.value == true
                                  ? 1.0
                                  : 0.0,
                          child: LabeledWidget(
                            label: 'المدينة',
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 49.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: Get
                                          .theme.colorScheme.primaryContainer
                                          .withOpacity(.5),
                                    ),
                                    padding:
                                        EdgeInsetsDirectional.only(end: 20.w),
                                    child: DropdownButton<City>(
                                      value: controller.selectedCity.value,
                                      onChanged: (value) =>
                                          controller.selectCity(value),
                                      borderRadius: BorderRadius.circular(14.r),
                                      elevation: 5,
                                      dropdownColor: Get
                                          .theme.colorScheme.primaryContainer,
                                      style: TextStyle(
                                        fontFamily: ProjectFonts.fontFamily,
                                        fontSize: 24.sp,
                                        color: Get.theme.colorScheme.primary,
                                      ),
                                      isExpanded: true,
                                      // icon: const SizedBox.shrink(),
                                      underline: const SizedBox.shrink(),
                                      items: controller.cities
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                  start: 30.w,
                                                ),
                                                child: Text(e.name),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                AddHorizontalSpacing(value: 10.w),
                                CustomFilledButton(
                                    height: 49.h,
                                    width: 120.w,
                                    onTap: () => controller.addCity(),
                                    child: 'إضافة جديد'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AddVerticalSpacing(value: 25.h),
                      Obx(
                        () => AnimatedOpacity(
                          duration: StudentAddressInfoDialogControllerConstants
                              .animationDuration,
                          curve: StudentAddressInfoDialogControllerConstants
                              .animationCurve,
                          opacity:
                              controller.areaDropDownButtonEnabled.value == true
                                  ? 1.0
                                  : 0.0,
                          child: LabeledWidget(
                            label: 'المنطقة',
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 49.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: Get
                                          .theme.colorScheme.primaryContainer
                                          .withOpacity(.5),
                                    ),
                                    padding:
                                        EdgeInsetsDirectional.only(end: 20.w),
                                    child: DropdownButton<Area>(
                                      value: controller.selectedArea.value,
                                      onChanged: (value) =>
                                          controller.selectArea(value),
                                      borderRadius: BorderRadius.circular(14.r),
                                      elevation: 5,
                                      dropdownColor: Get
                                          .theme.colorScheme.primaryContainer,
                                      style: TextStyle(
                                        fontFamily: ProjectFonts.fontFamily,
                                        fontSize: 24.sp,
                                        color: Get.theme.colorScheme.primary,
                                      ),
                                      isExpanded: true,
                                      // icon: const SizedBox.shrink(),
                                      underline: const SizedBox.shrink(),
                                      items: controller.areas
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                  start: 30.w,
                                                ),
                                                child: Text(e.name),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                AddHorizontalSpacing(value: 10.w),
                                CustomFilledButton(
                                    height: 49.h,
                                    width: 120.w,
                                    onTap: () => controller.addArea(),
                                    child: 'إضافة جديد'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AddVerticalSpacing(value: 25.h),
                      Obx(
                        () => AnimatedOpacity(
                          duration: StudentAddressInfoDialogControllerConstants
                              .animationDuration,
                          curve: StudentAddressInfoDialogControllerConstants
                              .animationCurve,
                          opacity:
                              controller.addressDropDownButtonEnabled.value ==
                                      true
                                  ? 1.0
                                  : 0.0,
                          child: LabeledWidget(
                            label: 'العنوان',
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 49.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: Get
                                          .theme.colorScheme.primaryContainer
                                          .withOpacity(.5),
                                    ),
                                    padding:
                                        EdgeInsetsDirectional.only(end: 20.w),
                                    child: DropdownButton<Address>(
                                      value: controller.selectedAddress.value,
                                      onChanged: (value) =>
                                          controller.selectAddress(value),
                                      borderRadius: BorderRadius.circular(14.r),
                                      elevation: 5,
                                      dropdownColor: Get
                                          .theme.colorScheme.primaryContainer,
                                      style: TextStyle(
                                        fontFamily: ProjectFonts.fontFamily,
                                        fontSize: 24.sp,
                                        color: Get.theme.colorScheme.primary,
                                      ),
                                      isExpanded: true,
                                      // icon: const SizedBox.shrink(),
                                      underline: const SizedBox.shrink(),
                                      items: controller.addresses
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                  start: 30.w,
                                                ),
                                                child: Text(e.name),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                AddHorizontalSpacing(value: 10.w),
                                CustomFilledButton(
                                    height: 49.h,
                                    width: 120.w,
                                    onTap: () => controller.addAddress(),
                                    child: 'إضافة جديد'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AddVerticalSpacing(value: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        height: 50.h,
                        onTap: () => Get.back(),
                        child: 'إلغاء الإجراء',
                      ),
                    ),
                    AddHorizontalSpacing(value: 20.w),
                    Expanded(
                      child: AnimatedOpacity(
                        opacity: controller.selectedAddress.value != null
                            ? 1.0
                            : 0.0,
                        duration: StudentAddressInfoDialogControllerConstants
                            .animationDuration,
                        curve: StudentAddressInfoDialogControllerConstants
                            .animationCurve,
                        child: CustomFilledButton(
                            height: 50.h,
                            onTap: () => controller.returnData(),
                            child: 'أختيار العنوان'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
