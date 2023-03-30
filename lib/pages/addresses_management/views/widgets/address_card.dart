import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/address/city.dart';

import '../../../../tools/ui_tools/ui_tools.dart';
import 'address_subcards.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.city,
  });

  final City city;
  @override
  Widget build(BuildContext context) {
    // AddressManagementController addressManagementController = Get.find();

    return Container(
      width: 815.w,
      height: 405.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          14.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: Offset(0.w, 30.h),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(14.r),
        child: InkWell(
          onTap: () {},
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
                AreasCountSubCard(
                  // count: city.getAreasCount(),
                  //TODO:
                  count: 5,
                ),
                AddVerticalSpacing(value: 10.h),
                AddressesCountSubCard(
                  // count: city.getAddressesCount(),
                  //TODO:
                  count: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
