import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/logic_controller.dart';

class StudentPersonalInformationSubWindow extends StatelessWidget {
  const StudentPersonalInformationSubWindow({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterNewStudentLogicController controller = Get.find();
    const Color scaffoldBackgroundColor = Colors.white;
    return SizedBox.expand(
      child: Padding(
        padding:
            EdgeInsets.only(top: 30.h, bottom: 20.h, left: 40.w, right: 40.w),
        child: LabeledWidget(
          label: 'المعلومات الشخصية للطالب',
          labelTextStyle: TextStyle(
            fontSize: 22.sp,
            color: Get.theme.colorScheme.primary,
          ),
          child: Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LabeledWidget(
                        label: 'رقم السجل العام',
                        child: HintedTextField(
                          hintText: '',
                          controller: controller.publicRecordIdController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      AddVerticalSpacing(value: 20.h),
                      LabeledWidget(
                        label: 'الأسم الأول',
                        child: HintedTextField(
                          controller: controller.firstNameController,
                          hintText: '',
                        ),
                      ),
                      AddVerticalSpacing(value: 20.h),
                      LabeledWidget(
                        label: 'الجنس',
                        child: Obx(
                          () {
                            return AnimatedContainer(
                              decoration: BoxDecoration(
                                color: controller.isMale.value == true
                                    ? Colors.cyan[300]
                                    : Colors.pink[300],
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              duration: const Duration(milliseconds: 700),
                              child: Material(
                                borderRadius: BorderRadius.circular(14.r),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(14.r),
                                  splashColor: Colors.transparent,
                                  onTap: () => controller.toggleGender(),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            controller.isMale.value == true
                                                ? 'ذكر'
                                                : 'انثى',
                                            style: TextStyle(
                                              fontSize: 22.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          AddHorizontalSpacing(value: 30.w),
                                          Icon(
                                            controller.isMale.value == true
                                                ? Icons.male
                                                : Icons.female,
                                            size: 25.sp,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      AddVerticalSpacing(value: 20.h),
                      LabeledWidget(
                        label: 'مكان الولادة',
                        child: HintedTextField(
                          controller: controller.placeOfBirthController,
                          hintText: '',
                        ),
                      ),
                    ],
                  ),
                ),
                AddHorizontalSpacing(value: 30.w),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  width: 500.w,
                  height: 460.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 30,
                        color: Colors.black.withOpacity(.07),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(25.w),
                  child: LabeledWidget(
                    label: 'تاريخ الولادة',
                    child: Obx(
                      () => CalendarDatePicker(
                        currentDate: controller.dateOfBirth.value,
                        firstDate: DateTime(2000),
                        initialDate: DateTime.now(),
                        lastDate: DateTime.now(),
                        onDateChanged: (DateTime value) =>
                            controller.changeDateOfBirth(value),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
