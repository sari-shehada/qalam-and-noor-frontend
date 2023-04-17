import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../tools/ui_tools/ui_tools.dart';

class AddressesManagementNumericStatsWidget extends StatelessWidget {
  const AddressesManagementNumericStatsWidget(
      {super.key, required this.future, required this.label, this.color});

  final String label;
  final Color? color;
  final Rx<Future<int>> future;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return Obx(
      () => FutureBuilder(
        future: future.value,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          snapshot.data.toString(),
                          style: TextStyle(color: themeData.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Text(
                    label,
                    style: textTheme.headlineMedium!.copyWith(
                      color: themeData.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'تعذر الحصول على إحصائيات',
                  style: textTheme.headlineMedium!.copyWith(
                    color: themeData.colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
