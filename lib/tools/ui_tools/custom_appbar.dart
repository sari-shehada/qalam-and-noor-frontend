// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import 'buttons.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.iconData,
    this.backButtonEnabled = false,
    this.actionButton,
  });

  final String title;
  final IconData iconData;
  final bool backButtonEnabled;
  final CustomAppBarActionButton? actionButton;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 60.w,
          end: 60.w,
        ),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            backButtonEnabled
                ? IconButton(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  )
                : const SizedBox.shrink(),
            FaIcon(
              iconData,
              size: 53.sp,
              color: Colors.black,
            ),
            AddHorizontalSpacing(value: 35.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 34.sp,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            actionButton == null
                ? const SizedBox.shrink()
                : CallToActionButton(
                    onTap: actionButton!.onTap,
                    height: 74.h,
                    width: 403.w,
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
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 150.h);
}

class CustomAppBarActionButton {
  final String label;
  final VoidCallback onTap;
  CustomAppBarActionButton({
    required this.label,
    required this.onTap,
  });
}
