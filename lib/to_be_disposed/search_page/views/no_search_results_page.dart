import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class NoSearchResultsPage extends StatelessWidget {
  const NoSearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FeatherIcons.search,
              size: 287.w,
              // weight: 10.h,
              color: const Color(0xffc7c7c7),
            ),
            AddVerticalSpacing(
              value: 50.h,
            ),
            Text(
              "لم يتم العثور على نتائج",
              style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            AddVerticalSpacing(
              value: 40.h,
            ),
            Text(
              '''جرب تغيير بعض محارف الكلمة أو التأكد
من مدخلات البحث ثم المحاولة مجدداً''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xff696a6b),
              ),
            ),
            AddVerticalSpacing(
              value: 90.h,
            ),
            SizedBox(
                width: 302.w,
                child:
                    CustomFilledButton(child: 'العودة الى الخلف', onTap: () {}))
          ],
        ),
      ),
    );
  }
}
