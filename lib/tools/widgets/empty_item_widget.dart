import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui_tools/ui_tools.dart';

class EmptyItemWidget extends StatelessWidget {
  const EmptyItemWidget(
      {super.key, required this.itemName, required this.iconData});

  final String itemName;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 287.w,
            // weight: 10.h,
            color: const Color(0xffc7c7c7),
          ),
          AddVerticalSpacing(
            value: 160.h,
          ),
          Text(
            "لم يتم العثور على $itemName",
            style: TextStyle(
                fontSize: 32.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          // AddVerticalSpacing(
          //   value: 80.h,
          // ),
          // SizedBox(
          //   width: 302.w,
          //   child: CallToActionButton(child: 'العودة الى الخلف', onTap: () {}),
          // )
        ],
      ),
    );
  }
}
