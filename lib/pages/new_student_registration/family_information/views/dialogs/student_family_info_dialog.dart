import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/dialog_controllers/student_family_info_dialog_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/views/widgets/student_family_info_card.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../tools/ui_tools/labeled_widget.dart';

class StudentFamilyInfoDialog extends StatelessWidget {
  const StudentFamilyInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Get.textTheme;
    final StudentFamilyInfoDialogController dialogController =
        Get.put(StudentFamilyInfoDialogController());
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Obx(() {
          return AnimatedContainer(
            duration: 600.milliseconds,
            curve: Curves.fastLinearToSlowEaseIn,
            width: 900.w,
            height: dialogController.initialDialogSize.value,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
            ),
            constraints: BoxConstraints(
              minHeight: StudentFamilyDialogConstants.collapsedDialogHeight,
              maxHeight: StudentFamilyDialogConstants.expandedDialogHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'أسرة الطالب',
                  style: textTheme.headlineMedium,
                ),
                AddVerticalSpacing(value: 25.h),
                Text(
                  'قم بإدخال رقم القيد للطالب ثم الضغط على زر البحث ثم اختيار أسرة الطالب',
                  style: textTheme.bodyLarge,
                ),
                AddVerticalSpacing(value: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: HintedTextField(
                        hintText: 'رقم القيد',
                        controller: dialogController.tieNumberEditingController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    AddHorizontalSpacing(value: 20.w),
                    CustomFilledButton(
                      width: 150.w,
                      onTap: dialogController.applySearch,
                      child: 'البحث',
                      buttonStatus: dialogController.searchButtonStatus,
                    ),
                  ],
                ),
                AddVerticalSpacing(value: 20.h),
                Obx(
                  () {
                    if (dialogController.familySearchResult.value == null) {
                      return const SizedBox.shrink();
                    }
                    return Expanded(
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          LabeledWidget(
                            label: 'نتائج البحث',
                            spacing: 20.h,
                            child: dialogController
                                    .familySearchResult.value!.isEmpty
                                //TODO: SARI Consider Adding an AddFamily Button
                                ? SizedBox(
                                    height: StudentFamilyDialogConstants
                                        .noSearchResultCardHeight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const Text('لم يتم العثور على نتائج'),
                                        AddVerticalSpacing(value: 25.h),
                                        CustomFilledButton(
                                            width: 350.w,
                                            height: 50.h,
                                            onTap: () => dialogController
                                                .addFamilyInfo(),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'إضافة معلومات أسرة الطالب',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                AddHorizontalSpacing(
                                                    value: 20.w),
                                                const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    height: StudentFamilyDialogConstants
                                            .searchResultCardHeight *
                                        3.5,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: dialogController
                                          .familySearchResult.value!.length,
                                      itemBuilder: (context, index) {
                                        return StudentFamilyInfoCard(
                                          familyInfo: dialogController
                                              .familySearchResult.value![index],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const Divider();
                                      },
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
