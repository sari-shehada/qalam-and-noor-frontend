import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/student_profile_controller.dart';

class AddressInformation extends GetView<StudentProfileController> {
  const AddressInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 270.w,
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: Column(
        children: [
          Text(
            "يسكن في ",
            style: ProjectFonts.headlineSmall(),
          ),
          AddVerticalSpacing(value: 15.h),
          Text(
            controller.studentAddressInfo.city.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          AddVerticalSpacing(value: 15.h),
          Text(controller.studentAddressInfo.area.name),
          AddVerticalSpacing(value: 15.h),
          Text(controller.studentAddressInfo.address.name),
          AddVerticalSpacing(value: 15.h),
          Builder(builder: (context) {
            if (controller.studentAddressInfo.address.details == null ||
                controller.studentAddressInfo.address.details == "" ||
                controller.studentAddressInfo.address.details == "-") {
              return const Text(
                "لا يوجد تفاصيل للعنوان",
              );
            }
            return Text(
              controller.studentAddressInfo.address.details!,
              style: TextStyle(fontSize: 10.sp),
            );
          }),
        ],
      ),
    );
  }
}
