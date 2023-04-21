import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/dialog_controllers/add_student_family_info_dialog_controller.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../models/enums.dart';

class StudentFatherInfoSubWidget extends StatelessWidget {
  const StudentFatherInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentFatherInfoSubWidgetController controller =
        Get.put(StudentFatherInfoSubWidgetController());
    return ListView(
      padding: EdgeInsets.only(bottom: 70.h, left: 30.w, right: 30.w),
      children: [
        LabeledWidget(
          label: 'الاسم الأول',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.firstNameController.controller,
              fillColor: controller.firstNameController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اللقب',
          child: Obx(
            () {
              return HintedTextField(
                hintText: '',
                controller: controller.lastNameController.controller,
                fillColor: controller.lastNameController.fillColor.value,
              );
            },
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اسم الأب',
          child: HintedTextField(
            hintText: '',
            controller: controller.fatherNameController.controller,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اسم الأم',
          child: HintedTextField(
            hintText: '',
            controller: controller.motherNameController.controller,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'المهنة',
          child: HintedTextField(
            hintText: '',
            controller: controller.careerController.controller,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان الإقامة',
          child: HintedTextField(
            hintText: '',
            controller: controller.placeOfResidenceController.controller,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'رقم القيد',
          child: HintedTextField(
            hintText: '',
            controller: controller.tieNumberController.controller,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان القيد',
          child: HintedTextField(
            hintText: '',
            controller: controller.tiePlaceController.controller,
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان الولادة',
          child: HintedTextField(
            hintText: '',
            controller: controller.placeOfBirthController.controller,
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
          label: 'أمانة السجل المدني',
          child: HintedTextField(
            hintText: '',
            controller: controller.civilRegisterSecretaryController.controller,
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
            controller: controller.phoneNumberController.controller,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'العنوان الدائم',
          child: HintedTextField(
            hintText: '',
            controller: controller.permanentAddressController.controller,
          ),
        ),
        AddVerticalSpacing(value: 30.h),
        CustomFilledButton(
          onTap: () => controller.toNextPage(),
          child: 'التالي',
        )
      ],
    );
  }
}

class StudentFatherInfoSubWidgetController extends GetxController {
  final ValidationTextField firstNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل الاسم الأول';
        }
        return null;
      });
  final ValidationTextField lastNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل اللقب';
        }
        return null;
      });
  final ValidationTextField fatherNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل اسم الأب';
        }
        return null;
      });
  final ValidationTextField motherNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل اسم الأم';
        }
        return null;
      });
  final ValidationTextField careerController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل المهنة';
        }
        return null;
      });
  final ValidationTextField placeOfResidenceController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل مكان الإقامة';
        }
        return null;
      });
  final ValidationTextField tieNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل رقم القيد';
        }
        return null;
      });
  final ValidationTextField tiePlaceController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل مكان القيد';
        }
        return null;
      });
  final ValidationTextField placeOfBirthController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل مكان الولادة';
        }
        return null;
      });
  final ValidationTextField civilRegisterSecretaryController =
      ValidationTextField(
          controller: TextEditingController(),
          validator: (controller) {
            if (controller.text.isEmpty) {
              return 'الرجاء ملئ حقل امانة السجل المدني';
            }
            return null;
          });
  final ValidationTextField phoneNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل رقم الهاتف';
        }
        if (controller.text.length != 10) {
          return 'رقم الهاتف لا يطابق البنية الصحيحة لأرقام الهواتف في سوريا';
        }
        return null;
      });
  final ValidationTextField permanentAddressController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل العنوان الدائم';
        }
        return null;
      });

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

  Father encapsulateObject() {
    return Father(
      id: -1,
      firstName: firstNameController.getValue(),
      lastName: lastNameController.getValue(),
      fatherName: fatherNameController.getValue(),
      motherName: motherNameController.getValue(),
      career: careerController.getValue(),
      placeOfResidence: placeOfResidenceController.getValue(),
      tieNumber: int.parse(tieNumberController.getValue()),
      tiePlace: tiePlaceController.getValue(),
      placeOfBirth: placeOfBirthController.getValue(),
      dateOfBirth: dateOfBirth.value!,
      civilRegisterSecretary: civilRegisterSecretaryController.getValue(),
      religion: religion.value,
      educationalStatus: educationalStatus.value,
      phoneNumber: phoneNumberController.getValue(),
      permanentAddress: permanentAddressController.getValue(),
    );
  }

  void changeDateOfBirth(DateTime? dateTime) {
    dateOfBirth.value = dateTime;
  }

  bool validateFields() {
    //TODO: Add Validation Here
    if (firstNameController.validate() &&
        lastNameController.validate() &&
        fatherNameController.validate() &&
        motherNameController.validate() &&
        careerController.validate() &&
        placeOfResidenceController.validate() &&
        tieNumberController.validate() &&
        tiePlaceController.validate() &&
        placeOfBirthController.validate() &&
        civilRegisterSecretaryController.validate() &&
        phoneNumberController.validate() &&
        permanentAddressController.validate()) {
      if (dateOfBirth.value == null) {
        SnackbarService.showErrorSnackBar(
          title: 'مدخلات فارغة',
          message: 'الرجاء إدخال تاريخ ميلاد الأب',
        );
        return false;
      }
      return true;
    }
    return false;
  }

  void toNextPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toNextPage();
    }
  }
}

class ValidationTextField<T> {
  final TextEditingController controller;
  late Rx<Color?> fillColor;
  final String? Function(TextEditingController controller) validator;

  ValidationTextField({required this.controller, required this.validator}) {
    this.fillColor = Rx<Color?>(null);
    controller.addListener(() {
      resetColor();
    });
  }

  bool validate() {
    String? message = validator(controller);
    if (message != null) {
      SnackbarService.showErrorSnackBar(
          title: 'خطأ في المدخلات', message: message);
      fillColor.value = Colors.red.withOpacity(.3);

      return false;
    }
    fillColor.value = null;

    return true;
  }

  resetColor() {
    if (fillColor.value != null) {
      fillColor.value = null;
      fillColor.refresh();
    }
  }

  String getValue() {
    return controller.text;
  }
}
