import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/dialog_controllers/add_student_family_info_dialog_controller.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../models/enums.dart';

class StudentMotherInfoSubWidget extends StatelessWidget {
  const StudentMotherInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentMotherInfoSubWidgetController controller =
        Get.put(StudentMotherInfoSubWidgetController());
    return ListView(
      padding: EdgeInsets.only(bottom: 70.h, left: 30.w, right: 30.w),
      children: [
        LabeledWidget(
          label: 'الاسم الأول',
          child: HintedTextField(
            hintText: '',
            controller: controller.firstNameController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اللقب',
          child: HintedTextField(
            hintText: '',
            controller: controller.lastNameController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اسم الأب',
          child: HintedTextField(
            hintText: '',
            controller: controller.fatherNameController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اسم الأم',
          child: HintedTextField(
            hintText: '',
            controller: controller.motherNameController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'هل تعيش مع الأب؟',
          child: Obx(
            () {
              return AnimatedContainer(
                decoration: BoxDecoration(
                  color: controller.doesLiveWithHusband.value == true
                      ? Colors.greenAccent.shade700
                      : Colors.redAccent,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                duration: const Duration(milliseconds: 400),
                child: Material(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14.r),
                    splashColor: Colors.transparent,
                    onTap: () => controller.toggleLivesWithHusband(),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        child: Center(
                          child: Text(
                            controller.doesLiveWithHusband.value == true
                                ? 'نعم'
                                : 'لا',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'المهنة',
          child: HintedTextField(
            hintText: '',
            controller: controller.careerController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'رقم القيد',
          child: HintedTextField(
            hintText: '',
            controller: controller.tieNumberController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان القيد',
          child: HintedTextField(
            hintText: '',
            controller: controller.tiePlaceController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان الولادة',
          child: HintedTextField(
            hintText: '',
            controller: controller.placeOfBirthController,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
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
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'الديانة',
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: Get.theme.colorScheme.primaryContainer.withOpacity(.5),
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: DropdownButton<Religion>(
                value: controller.religion.value,
                onChanged: (value) => controller.changeReligion(value),
                borderRadius: BorderRadius.circular(14.r),
                elevation: 5,
                dropdownColor: Get.theme.colorScheme.primaryContainer,
                style: TextStyle(
                  fontFamily: ProjectFonts.fontFamily,
                  fontSize: 24.sp,
                  color: Get.theme.colorScheme.primary,
                ),
                isExpanded: true,
                icon: const SizedBox.shrink(),
                underline: const SizedBox.shrink(),
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
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'الحاة التعليمية',
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: Get.theme.colorScheme.primaryContainer.withOpacity(.5),
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: DropdownButton<EducationalStatus>(
                value: controller.educationalStatus.value,
                onChanged: (value) => controller.changeEducationalStatus(value),
                borderRadius: BorderRadius.circular(14.r),
                elevation: 5,
                dropdownColor: Get.theme.colorScheme.primaryContainer,
                style: TextStyle(
                  fontFamily: ProjectFonts.fontFamily,
                  fontSize: 24.sp,
                  color: Get.theme.colorScheme.primary,
                ),
                isExpanded: true,
                icon: const SizedBox.shrink(),
                underline: const SizedBox.shrink(),
                items: EducationalStatus.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 30.w,
                          ),
                          child: Text(educationalStatusAsString[e]!),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'رقم الهاتف',
          child: HintedTextField(
            hintText: '',
            controller: controller.phoneNumberController,
          ),
        ),
        AddVerticalSpacing(value: 30.h),
        SizedBox(
          height: 60.h,
          child: Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                    height: 55.h,
                    onTap: () => controller.toPreviousPage(),
                    child: 'السابق'),
              ),
              AddHorizontalSpacing(value: 20.w),
              Expanded(
                child: CustomFilledButton(
                  height: 55.h,
                  onTap: () => controller.toNextPage(),
                  child: 'التالي',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StudentMotherInfoSubWidgetController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController careerController = TextEditingController();
  final TextEditingController tieNumberController = TextEditingController();
  final TextEditingController tiePlaceController = TextEditingController();
  final TextEditingController placeOfBirthController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  RxBool doesLiveWithHusband = true.obs;
  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  Rx<Religion> religion = Religion.undefined.obs;
  Rx<EducationalStatus> educationalStatus = EducationalStatus.none.obs;

  void changeReligion(Religion? newReligion) {
    if (newReligion != null) religion.value = newReligion;
  }

  void changeEducationalStatus(EducationalStatus? newEducationalStatus) {
    if (newEducationalStatus != null) {
      educationalStatus.value = newEducationalStatus;
    }
  }

  void changeDateOfBirth(DateTime? dateTime) {
    dateOfBirth.value = dateTime;
  }

  void toggleLivesWithHusband() {
    doesLiveWithHusband.value = !doesLiveWithHusband.value;
  }

  bool validateFields() {
    //TODO: Add Validation Here
    return true;
  }

  Mother encapsulateObject() {
    return Mother(
      id: -1,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      fatherName: fatherNameController.text,
      motherName: motherNameController.text,
      doesLiveWithHusband: doesLiveWithHusband.value,
      career: careerController.text,
      tieNumber: int.parse(tieNumberController.text),
      tiePlace: tiePlaceController.text,
      placeOfBirth: placeOfBirthController.text,
      dateOfBirth: dateOfBirth.value!,
      religion: religion.value,
      educationalStatus: educationalStatus.value,
      phoneNumber: phoneNumberController.text,
    );
  }

  void toNextPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toNextPage();
    }
  }

  void toPreviousPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toPreviousPage();
    }
  }
}
