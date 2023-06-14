import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

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
            size: 300.sp,
            color: Get.theme.colorScheme.onSurfaceVariant,
          ),
          AddVerticalSpacing(value: 140.h),
          Text(
            'اضغط على محادثة لعرض التفاصيل',
            style: ProjectFonts.displayMedium()
                .copyWith(color: Get.theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
