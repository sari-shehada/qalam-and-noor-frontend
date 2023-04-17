import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';

import '../../../../models/enums.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../../pages/new_student_registration/student_information/views/new_student_registration_page.dart';
import '../../controllers/logic_controller.dart';

class StudentCivilianInformationSubWindow extends StatelessWidget {
  const StudentCivilianInformationSubWindow({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterNewStudentLogicController controller = Get.find();
    const Color scaffoldBackgroundColor = Colors.white;
    return SizedBox.expand(
      child: Padding(
        padding:
            EdgeInsets.only(top: 30.h, bottom: 20.h, left: 40.w, right: 40.w),
        child: LabeledWidget(
          label: 'المعلومات المدنية للطالب',
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
                        label: 'الديانة',
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: Get.theme.colorScheme.primaryContainer
                                  .withOpacity(.5),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: DropdownButton<Religion>(
                              value: controller.religion.value,
                              onChanged: (value) =>
                                  controller.changeReligion(value),
                              borderRadius: BorderRadius.circular(14.r),
                              elevation: 5,
                              dropdownColor:
                                  Get.theme.colorScheme.primaryContainer,
                              style: TextStyle(
                                fontFamily: ProjectFonts.fontFamily,
                                fontSize: 24.sp,
                                color: Get.theme.colorScheme.primary,
                              ),
                              isExpanded: true,
                              icon: SizedBox.shrink(),
                              underline: SizedBox.shrink(),
                              itemHeight: 60.h,
                              items: Religion.values
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: 30.w,
                                        ),
                                        child: Text(religionAsString[e]!),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      AddVerticalSpacing(value: 20.h),
                      LabeledWidget(
                        label: 'رقم الواقعة',
                        child: HintedTextField(
                          hintText: '',
                          controller: controller.incidentNumberController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
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
                    label: 'تاريخ الواقعة',
                    child: Obx(
                      () => CalendarDatePicker(
                        currentDate: controller.dateOfIncident.value,
                        firstDate: DateTime(2000),
                        initialDate: DateTime.now(),
                        lastDate: DateTime.now(),
                        onDateChanged: (DateTime value) =>
                            controller.changeDateOfIncident(value),
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
