import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/loader_widget.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
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
      child: FutureBuilder(
          future: controller.getFUllAddress(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                child: const LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return const ErrorLoadingSomethingWidget(
                  somethingName: "العنوان");
            }

            return Column(
              children: [
                Text(
                  "يسكن في ",
                  style: ProjectFonts.headlineSmall(),
                ),
                AddVerticalSpacing(value: 15.h),
                Text(
                  snapshot.data!.city.name,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                AddVerticalSpacing(value: 15.h),
                Text(snapshot.data!.area.name),
                AddVerticalSpacing(value: 15.h),
                Text(snapshot.data!.address.name),
                AddVerticalSpacing(value: 15.h),
                Builder(builder: (context) {
                  if (snapshot.data!.address.details == null ||
                      snapshot.data!.address.details == "" ||
                      snapshot.data!.address.details == "-") {
                    return Text("لا يوجد تفاصيل للعنوان");
                  }
                  return Text(
                    snapshot.data!.address.details!,
                    style: TextStyle(fontSize: 10.sp),
                  );
                }),
              ],
            );
          }),
    );
  }
}
