import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalam_noor/models/public_record.dart';
import 'package:kalam_noor/tools/logic_tools/datetime_helper.dart';

import '../../../../configs/fonts.dart';

class PublicRecordRow extends StatelessWidget {
  const PublicRecordRow(
      {super.key, required this.record, required this.rowColor});

  final PublicRecord record;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            // onTap: () =>
            //     Get.to(const CityDetailsPage(), binding: BindingsBuilder(() {
            //   Get.put(CityDetailsController(city: city));
            // })),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.publicRecordId.toString(),
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${record.studentFirstName} ${record.fatherName} ${record.studentLastName}",
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.motherName,
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.grandFatherName,
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${record.tiePlace}: ${record.tieNumber}',
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.studentGender ? 'ذكر' : 'انثى',
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.studentPlaceOfBirth,
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateTimeHelper.getDateWithoutTime(
                        record.studentDateOfBirth,
                      ),
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.studentPhoneNumber,
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.studentWhataappPhoneNumber,
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      record.studentLandLine,
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${record.cityName} / ${record.areaName} / ${record.addressName}',
                      style: ProjectFonts.titleMedium()
                          .copyWith(fontWeight: FontWeight.normal),
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
