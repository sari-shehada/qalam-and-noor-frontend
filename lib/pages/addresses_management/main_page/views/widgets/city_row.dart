import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/address/city.dart';

import '../../../city_details_page/controllers/city_details_controller.dart';
import '../../../city_details_page/views/city_details_page.dart';
import '../../controllers/address_management_controller.dart';

class CityRow extends StatelessWidget {
  const CityRow({
    super.key,
    required this.city,
    required this.rowColor,
  });

  final City city;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    AddressManagementController controller = Get.find();
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () =>
                Get.to(const CityDetailsPage(), binding: BindingsBuilder(() {
              Get.put(CityDetailsController(city: city));
            })),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      city.name,
                      style: textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    child: IconButton(
                      // onPressed: () {},
                      onPressed: () => controller.updateCityInfo(city),
                      icon: Icon(
                        Icons.edit,
                        color: Get.theme.colorScheme.primary.withOpacity(.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
