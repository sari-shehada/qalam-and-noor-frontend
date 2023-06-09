// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import 'buttons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.iconData,
    this.backButtonEnabled = false,
    this.actionButton,
    this.appBarBoxDecoration,
    this.padding,
  });

  final String title;
  final IconData iconData;
  final bool backButtonEnabled;
  final dynamic actionButton;
  final BoxDecoration? appBarBoxDecoration;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    assert(
        actionButton == null ||
            actionButton is CustomAppBarActionButton ||
            actionButton is Widget,
        'Assertion Failed for Custom Appbar Action Button');
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: padding ??
            EdgeInsetsDirectional.only(
              start: 50.w,
              end: 40.w,
            ),
        decoration: appBarBoxDecoration,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            backButtonEnabled
                ? Padding(
                    padding: EdgeInsets.only(right: 40.w, left: 20.w),
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(
                        15.w,
                      ),
                      onPressed: () => Get.back(),
                      iconSize: 24.sp,
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.black,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            FaIcon(
              iconData,
              size: 42.sp,
              color: Get.theme.colorScheme.primary,
            ),
            AddHorizontalSpacing(value: 30.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 25.sp,
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            actionButton == null
                ? const SizedBox.shrink()
                : actionButton is CustomAppBarActionButton
                    ? CustomFilledButton(
                        onTap: actionButton!.onTap,
                        height: 74.h,
                        width: 403.w,
                        buttonStatus: (actionButton as CustomAppBarActionButton)
                            .buttonStatus,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Row(
                              children: [
                                Text(
                                  actionButton!.label,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                  size: 28.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : actionButton
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 100.h);
}

class CustomAppBarActionButton {
  final String label;
  final VoidCallback onTap;
  final Rx<CustomButtonStatus>? buttonStatus;
  CustomAppBarActionButton({
    required this.label,
    required this.onTap,
    this.buttonStatus,
  });
}
