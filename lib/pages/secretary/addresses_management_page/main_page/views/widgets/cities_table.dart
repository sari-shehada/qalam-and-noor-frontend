import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/addresses_management_page/main_page/views/widgets/city_row.dart';

import '../../../../../../models/address/city.dart';

class CitiesTable extends StatelessWidget {
  const CitiesTable({
    super.key,
    required this.cities,
  });

  final List<City> cities;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                border: Border.all(color: colorScheme.primary),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: colorScheme.primary),
                        ),
                      ),
                      child: Text(
                        'اسم المدينة',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      child: Text(
                        'الاجراءات',
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 100.h),
                itemCount: cities.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Color rowColor = index % 2 == 0
                      ? Colors.white
                      : Get.theme.colorScheme.primaryContainer.withOpacity(.2);
                  return CityRow(city: cities[index], rowColor: rowColor);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
