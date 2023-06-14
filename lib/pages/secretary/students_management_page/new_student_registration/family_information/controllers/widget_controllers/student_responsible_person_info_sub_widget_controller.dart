import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/family_information/controllers/widget_controllers/student_father_info_sub_widget_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/family_information/controllers/widget_controllers/student_mother_info_sub_widget_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/family_information/models/validation_text_field.dart';

import '../../../../../../../models/agendas/family.dart';
import '../../../../../../../models/agendas/father.dart';
import '../../../../../../../models/agendas/mother.dart';
import '../../../../../../../models/agendas/responsible_person.dart';
import '../../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../models/family_info.dart';
import '../dialog_controllers/add_student_family_info_dialog_controller.dart';

class StudentResponsiblePersonInfoSubWidgetController extends GetxController {
  final ValidationTextField firstNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل الإسم الأول';
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
  final ValidationTextField relationToStudentController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل علاقته مع الطالب';
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

  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  RxBool responsiblePersonExists = false.obs;

  @override
  void onInit() {
    firstNameController.controller
        .addListener(() => checkResponsiblePersonExistence());
    super.onInit();
  }

  void changeDateOfBirth(DateTime? dateTime) {
    dateOfBirth.value = dateTime;
  }

  bool validateFields() {
    if (firstNameController.validate() &&
        lastNameController.validate() &&
        relationToStudentController.validate() &&
        placeOfBirthController.validate() &&
        phoneNumberController.validate()) {
      if (dateOfBirth.value == null) {
        SnackBarService.showErrorSnackBar(
          title: 'مدخلات فارغة',
          message: 'الرجاء إدخال تاريخ الولادة',
        );
        return false;
      }
      return true;
    }
    return false;
  }

  bool checkResponsiblePersonExistence() {
    if (firstNameController.controller.text.isNotEmpty) {
      responsiblePersonExists.value = true;
    } else {
      responsiblePersonExists.value = false;
    }
    return responsiblePersonExists.value;
  }

  void returnData() {
    Father father;
    Mother mother;
    ResponsiblePerson? responsiblePerson;
    if (responsiblePersonExists.value) {
      if (!validateFields()) {
        return;
      }
      responsiblePerson = encapsulateObject();
    }
    father =
        Get.find<StudentFatherInfoSubWidgetController>().encapsulateObject();
    mother =
        Get.find<StudentMotherInfoSubWidgetController>().encapsulateObject();

    Family family = Family(
      id: -1,
      userName: 'asd',
      password: 'assd',
      fatherId: father.id,
      motherId: mother.id,
      responsiblePersonId: responsiblePerson?.id,
    );
    Get.back(
      result: FamilyInfo(
        family: family,
        father: father,
        mother: mother,
        responsiblePerson: responsiblePerson,
      ),
    );
  }

  ResponsiblePerson encapsulateObject() {
    return ResponsiblePerson(
      id: -1,
      firstName: firstNameController.getValue(),
      lastName: lastNameController.getValue(),
      relationToStudent: relationToStudentController.getValue(),
      phoneNumber: phoneNumberController.getValue(),
      dateOfBirth: dateOfBirth.value!,
      placeOfBirth: placeOfBirthController.getValue(),
    );
  }

  void toPreviousPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toPreviousPage();
    }
  }
}
