import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/dialog_controllers/student_family_info_dialog_controller.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'أسرة الطالب',
                  style: textTheme.headlineMedium,
                ),
                AddVerticalSpacing(value: 25.h),
                Text(
                  'قم بإدخال رقم القيد للطالب ثم الضغط على زر البحث ثم أختيار أسرة الطالب',
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
                AddVerticalSpacing(value: 10.h),
                Obx(
                  () {
                    if (dialogController.familySearchResult.value == null) {
                      return const SizedBox.shrink();
                    }
                    return Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          LabeledWidget(
                            label: 'نتائج البحث',
                            child: dialogController
                                    .familySearchResult.value!.isEmpty
                                //TODO: SARI Consider Adding an AddFamily Button
                                ? SizedBox(
                                    height: 400.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Text('لم يتم العثور على نتائج'),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: dialogController
                                        .familySearchResult.value!.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        //TODO: Build Card For Each Family
                                        title: Text(
                                          dialogController.familySearchResult
                                              .value![index].userName,
                                        ),
                                      );
                                    },
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
