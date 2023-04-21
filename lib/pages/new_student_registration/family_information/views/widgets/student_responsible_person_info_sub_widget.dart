import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/dialog_controllers/add_student_family_info_dialog_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/models/family_info.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/views/widgets/student_father_info_sub_widget.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/views/widgets/student_mother_info_sub_widget.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class StudentResponsiblePersonInfoSubWidget extends StatelessWidget {
  const StudentResponsiblePersonInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentResponsiblePersonInfoSubWidgetController controller =
        Get.put(StudentResponsiblePersonInfoSubWidgetController());
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
          label: 'العلاقة بالطالب',
          child: HintedTextField(
            hintText: 'عم ، عمة ، خال...',
            controller: controller.relationToStudentController,
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
                child: Obx(
                  () => CustomFilledButton(
                    height: 55.h,
                    onTap: () => controller.returnData(),
                    child: controller.responsiblePersonExists.value == true
                        ? 'اضافة معلومات الأسرة'
                        : 'تخطي واضافة المعلومات',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StudentResponsiblePersonInfoSubWidgetController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController relationToStudentController =
      TextEditingController();

  final TextEditingController placeOfBirthController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  RxBool responsiblePersonExists = false.obs;

  @override
  void onInit() {
    firstNameController.addListener(() => checkResponsiblePersonExistence());
    super.onInit();
  }

  void changeDateOfBirth(DateTime? dateTime) {
    dateOfBirth.value = dateTime;
  }

  bool validateFields() {
    //TODO: Add Validation Here
    return true;
  }

  bool checkResponsiblePersonExistence() {
    if (firstNameController.text.isNotEmpty) {
      responsiblePersonExists.value = true;
    } else {
      responsiblePersonExists.value = false;
    }
    return responsiblePersonExists.value;
  }

  void returnData() {
    Father father;
    Mother mother;
    ResponsiblePerson? responsiblePerson = null;
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
        motherId: mother.id);
    Get.back(
      result: FamilyInfo(family: family, father: father, mother: mother),
    );
  }

  ResponsiblePerson encapsulateObject() {
    return ResponsiblePerson(
      id: -1,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      relationToStudent: relationToStudentController.text,
      phoneNumber: phoneNumberController.text,
      dateOfBirth: dateOfBirth.value!,
      placeOfBirth: placeOfBirthController.text,
    );
  }

  void toPreviousPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toPreviousPage();
    }
  }
}
