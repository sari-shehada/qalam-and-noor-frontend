import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../configs/styles.dart';
import '../../controllers/dialog_controllers/student_family_info_dialog_controller.dart';
import '../../models/family_info.dart';
import '../../../../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';

class StudentFamilyInfoCard extends StatelessWidget {
  const StudentFamilyInfoCard({
    super.key,
    required this.familyInfo,
    this.clickable = true,
  });

  final FamilyInfo familyInfo;
  final bool clickable;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Get.textTheme;
    final TextStyle subLabelTextStyle =
        textTheme.titleMedium!.copyWith(color: Get.theme.colorScheme.primary);
    final TextStyle subLabelDataTextStyle =
        subLabelTextStyle.copyWith(color: Get.theme.colorScheme.outline);
    return Material(
      color: Get.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
      child: Tooltip(
        waitDuration: 300.milliseconds,
        message: clickable == true ? 'اختيار هذه العائلة' : '',
        child: InkWell(
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          onTap: clickable == true ? () => Get.back(result: familyInfo) : null,
          child: SizedBox(
            height: StudentFamilyDialogConstants.searchResultCardHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w, vertical: 5.h),
                      child: Column(
                        children: [
                          Text(
                            'الأب',
                            style: textTheme.titleLarge,
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الأسم:',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                '${familyInfo.father.firstName} ${familyInfo.father.fatherName} ${familyInfo.father.lastName}',
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'القيد:',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                '${familyInfo.father.tiePlace}: ${familyInfo.father.tieNumber}',
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'تاريخ الميلاد:',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                DateTimeHelper.getDateWithoutTime(
                                    familyInfo.father.dateOfBirth),
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'العنوان الدائم:',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                familyInfo.father.permenantAddress,
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(
                    indent: 20.h,
                    endIndent: 0.h,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w, vertical: 8.h),
                      child: Column(
                        children: [
                          Text(
                            'الأم',
                            style: textTheme.titleLarge,
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الأسم:',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                '${familyInfo.mother.firstName} ${familyInfo.mother.fatherName} ${familyInfo.mother.lastName}',
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'القيد:',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                '${familyInfo.mother.tiePlace}: ${familyInfo.mother.tieNumber}',
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'تاريخ الميلاد:',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                DateTimeHelper.getDateWithoutTime(
                                    familyInfo.mother.dateOfBirth),
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'تعيش مع الأب؟',
                                style: subLabelTextStyle,
                              ),
                              Text(
                                familyInfo.mother.doesLiveWithHasband == true
                                    ? 'نعم'
                                    : 'لا',
                                style: subLabelDataTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
