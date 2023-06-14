import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/vaccine.dart';
import '../../controllers/vaccines_management_controller.dart';

class VaccineRow extends StatelessWidget {
  const VaccineRow({super.key, required this.vaccine, required this.rowColor});

  final Vaccine vaccine;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    VaccinesManagementController controller = Get.find();
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
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
                      vaccine.name,
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
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
                      onPressed: () => controller.updateVaccineInfo(vaccine),
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
