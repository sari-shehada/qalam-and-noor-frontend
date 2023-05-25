import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class NoConversationYetSubPage extends StatelessWidget {
  const NoConversationYetSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.message,
            size: 90.sp,
          ),
          AddVerticalSpacing(value: 80.h),
          Text(
            'اضغط على محادثة لعرض التفاصيل',
            style: ProjectFonts.titleMedium()
                .copyWith(color: Get.theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
