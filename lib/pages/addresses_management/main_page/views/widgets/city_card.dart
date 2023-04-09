import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../models/address/city.dart';
import '../../../../../models/helpers/database_helper.dart';
import '../../../city_details_page/controllers/city_details_controller.dart';
import '../../../city_details_page/views/city_details_page.dart';

import '../../../../../tools/ui_tools/ui_tools.dart';
import 'city_stats_card.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.city,
  });

  final City city;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 815.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          14.r,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: Offset(0.w, 30.h),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(14.r),
        child: InkWell(
          onTap: () =>
              Get.to(const CityDetailsPage(), binding: BindingsBuilder(() {
            Get.put(CityDetailsController(city: city));
          })),
          borderRadius: BorderRadius.circular(14.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  city.name,
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
                const Spacer(),
                CityStatsCard(
                  title: 'عدد المناطق',
                  count: DatabaseHelper.getCityAreasCount(city.id),
                  color: const Color(0xFFE03168),
                ),
                AddVerticalSpacing(value: 10.h),
                CityStatsCard(
                  title: 'عدد العناوين',
                  count: DatabaseHelper.getCityAddressesCount(city.id),
                  color: const Color(0xFFFA9746),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
