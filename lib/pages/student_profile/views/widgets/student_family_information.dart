import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/family.dart';
import 'package:kalam_noor/pages/student_profile/controllers/student_profile_controller.dart';

import '../../../../configs/fonts.dart';
import '../../../../models/agendas/father.dart';
import '../../../../models/agendas/mother.dart';
import '../../../../models/helpers/database_helpers/father_db_helper.dart';
import '../../../../models/helpers/database_helpers/mother_db_helper.dart';
import '../../../../tools/ui_tools/loader_widget.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../account_settings_page/views/widgets/profile_info_widget.dart';

class FamilyInfo extends GetView<StudentProfileController> {
  const FamilyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      width: 650.w,
      height: 385.h,
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.w, bottom: 10.w),
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20.h),
            blurRadius: 12,
            color: colorScheme.primary.withOpacity(.09),
          ),
        ],
      ),
      child: FutureBuilder<Family?>(
          future: controller.getFamily(),
          builder: (context, snapshot1) {
            if (snapshot1.connectionState == ConnectionState.waiting) {
              return ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                child: const LoaderWidget(),
              );
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "معلومات العائلة",
                    style: ProjectFonts.headlineMedium(),
                  ),
                  AddVerticalSpacing(
                    value: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder<Father?>(
                          future: FatherDBhelper.instance
                              .getById(snapshot1.data!.fatherId),
                          builder: (context, snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                                child: const LoaderWidget(),
                              );
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.userTie,
                                  label:
                                      "${snapshot2.data?.firstName} ${snapshot2.data?.lastName}",
                                  toolTip: "إسم الأب الكامل",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.briefcase,
                                  label: snapshot2.data!.career,
                                  toolTip: "المهنة",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.mobile,
                                  label: snapshot2.data!.phoneNumber,
                                  toolTip: "رقم الهاتف",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.locationDot,
                                  label:
                                      "${snapshot2.data?.tiePlace}   ${snapshot2.data?.tieNumber}",
                                  toolTip: "مكان ورقم القيد",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.mapLocationDot,
                                  label: snapshot2.data!.permenantAddress,
                                  toolTip: "العنوان الدائم",
                                ),
                              ],
                            );
                          }),
                      Container(
                        margin: EdgeInsets.only(left: 35.w, right: 35.w),
                        width: 1.w,
                        height: 300.h,
                        decoration: BoxDecoration(color: colorScheme.primary),
                      ),
                      FutureBuilder<Mother?>(
                          future: MotherDBHelper.instance
                              .getById(snapshot1.data!.motherId),
                          builder: (context, snapshot3) {
                            if (snapshot3.connectionState ==
                                ConnectionState.waiting) {
                              return ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                                child: const LoaderWidget(),
                              );
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.personDress,
                                  label:
                                      "${snapshot3.data?.firstName} ${snapshot3.data?.lastName}",
                                  toolTip: "إسم الأم الكامل",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.briefcase,
                                  label: snapshot3.data!.career,
                                  toolTip: "المهنة",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.mobile,
                                  label: snapshot3.data!.phoneNumber,
                                  toolTip: "رقم الهاتف",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.locationDot,
                                  label:
                                      "${snapshot3.data?.tiePlace}  ${snapshot3.data?.tieNumber}",
                                  toolTip: "مكان ورقم القيد",
                                ),
                                AddVerticalSpacing(value: 15.h),
                                IconLabelItem(
                                  iconData: FontAwesomeIcons.mapLocationDot,
                                  label: snapshot3.data!.placeOfBirth,
                                  toolTip: "مكان الولادة",
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ]);
          }),
    );
  }
}
