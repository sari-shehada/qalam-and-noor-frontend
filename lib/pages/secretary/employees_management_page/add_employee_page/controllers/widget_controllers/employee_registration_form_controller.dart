import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../models/agendas/employee.dart';
import '../../../../../../models/agendas/job_title.dart';
import '../../../../../../models/helpers/database_helpers/job_titles_db_helper.dart';
import '../add_employee_controller.dart';
import '../../models/employee_credentials_generator.dart';
import '../../../../students_management_page/new_student_registration/family_information/models/validation_text_field.dart';

import '../../../../students_management_page/new_student_registration/address_information/models/student_address_info.dart';
import '../../../../students_management_page/new_student_registration/address_information/views/dialogs/student_address_info_dialog.dart';

class EmployeeRegistrationFormController extends GetxController {
  final RxBool isMale = true.obs;
  final Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  final Rx<DateTime?> startDate = Rx<DateTime?>(null);
  final Rx<JobTitle?> selectedJobTitle = Rx<JobTitle?>(null);
  final Rx<StudentAddressInfo?> selectedAddress = Rx<StudentAddressInfo?>(null);
  final RxList<JobTitle> jobTitles = <JobTitle>[].obs;

  @override
  void onInit() async {
    super.onInit();
    jobTitles.value = await getJobTitles();
  }

  final ValidationTextField firstNameController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملئ حقل الاسم الأول';
      }
      return null;
    },
  );
  final ValidationTextField lastNameController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملئ حقل اللقب';
      }
      return null;
    },
  );
  final ValidationTextField fatherNameController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملئ حقل اسم الأب';
      }
      return null;
    },
  );
  final ValidationTextField motherNameController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملئ حقل اسم الأم';
      }
      return null;
    },
  );
  final ValidationTextField placeOfBirthController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملئ حقل مكان الولادة';
      }
      return null;
    },
  );
  final ValidationTextField phoneNumberController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملئ حقل رقم الهاتف';
      }
      if (controller.text.length != 10) {
        return 'رقم الهاتف المدخل لايطابق البنية الصحيحة لأرقام الهواتف المحمولة في سوريا';
      }
      if (controller.text[0] != '0' || controller.text[1] != '9') {
        return 'رقم الهاتف المدخل لايطابق البنية الصحيحة لأرقام الهواتف المحمولة في سوريا';
      }
      return null;
    },
  );
  final ValidationTextField numberOfChildrenController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملئ حقل عدد الأولاد';
      }
      if (!controller.text.isNumericOnly) {
        return 'يجب ان يحتوي حقل عدد الأولاد علي ازقام فقط';
      }
      return null;
    },
  );

  void toggleGender() {
    isMale.value = !isMale.value;
  }

  bool validateFields() {
    if (!firstNameController.validate() ||
        !lastNameController.validate() ||
        dateOfBirth.value == null) {
      changeOffset(0);
      return false;
    }
    if (!fatherNameController.validate() ||
        !motherNameController.validate() ||
        !numberOfChildrenController.validate()) {
      changeOffset(1);
      return false;
    }
    if (!phoneNumberController.validate()) {
      changeOffset(2);
      return false;
    }
    if (startDate.value == null || selectedJobTitle.value == null) {
      changeOffset(3);
      return false;
    }
    if (selectedAddress.value == null || !placeOfBirthController.validate()) {
      changeOffset(4);
      return false;
    }
    return true;
  }

  Future<void> selectDateOfBirth() async {
    final result = await Get.dialog(
      DatePickerDialog(
        helpText: 'أختر تاريخ الميلاد',
        cancelText: 'إلغاد الإجراء',
        confirmText: 'اختيار التاريخ',
        initialDate: DateTime(1980),
        firstDate: DateTime(1950),
        lastDate: DateTime(2005),
      ),
    );
    if (result is DateTime) {
      dateOfBirth.value = result;
    }
  }

  Future<void> selectStartDate() async {
    final result = await Get.dialog(
      DatePickerDialog(
        helpText: 'أختر تاريخ الشروع بالعمل',
        cancelText: 'إلغاد الإجراء',
        confirmText: 'اختيار التاريخ',
        initialDate: DateTime(2023),
        firstDate: DateTime(2005),
        lastDate: DateTime(2024),
      ),
    );
    if (result is DateTime) {
      startDate.value = result;
    }
  }

  void changeOffset(int sectionIndex) {
    Get.find<AddEmployeeController>().animateToSection(
        Get.find<AddEmployeeController>().sections[sectionIndex]);
  }

  void selectJobTitle(JobTitle? jobTitle) {
    if (jobTitle == null) {
      return;
    }
    selectedJobTitle.value = jobTitle;
    selectedJobTitle.refresh();
  }

  Employee encapsulateFields() {
    return Employee(
      id: -1,
      firstName: firstNameController.controller.text,
      lastName: lastNameController.controller.text,
      fatherName: fatherNameController.controller.text,
      motherName: motherNameController.controller.text,
      dateOfBirth: dateOfBirth.value!,
      startDate: startDate.value!,
      isMale: isMale.value,
      numberOfChildren: int.parse(numberOfChildrenController.controller.text),
      jobTitleId: selectedJobTitle.value!.id,
      addressId: selectedAddress.value!.address.id,
      placeOfBirth: placeOfBirthController.controller.text,
      userName: EmployeeCredentialsGenerator.generateUserName(
        firstName: firstNameController.controller.text,
        lastName: lastNameController.controller.text,
        jobTitle: selectedJobTitle.value!.name,
        dateOfBirth: dateOfBirth.value!,
      ),
      password: EmployeeCredentialsGenerator.generatePassword(
        firstName: firstNameController.controller.text,
        lastName: lastNameController.controller.text,
      ),
    );
  }

  Future<List<JobTitle>> getJobTitles() async {
    return JobTitlesDBHelper.instance.getAll();
  }

  Future<void> selectAddress() async {
    var result = await Get.dialog(const StudentAddressInfoDialog());
    if (result is StudentAddressInfo) {
      selectedAddress.value = result;
      selectedAddress.refresh();
    }
  }
}
