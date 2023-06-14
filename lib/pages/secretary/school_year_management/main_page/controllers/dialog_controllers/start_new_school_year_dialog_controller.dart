import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_years_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/semesters_db_helper.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

class StartNewSchoolYearDialogController extends GetxController {
  StartNewSchoolYearDialogController({required this.currentSchoolYear});
  final SchoolYear currentSchoolYear;
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  TextEditingController schoolYearNameController = TextEditingController();
  TextEditingController firstSemesterNameController = TextEditingController();

  String? validateFields() {
    if (schoolYearNameController.text.isEmpty) {
      return 'الرجاء ملئ حقل اسم العام الدراسي';
    }
    if (firstSemesterNameController.text.isEmpty) {
      return 'الرجاء ملئ حقل اسم الفصل الدراسي الأول';
    }
    return null;
  }

  Future<void> startSchoolYear() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      String? validationMessage = validateFields();
      if (validationMessage != null) {
        SnackBarService.showErrorSnackBar(
          title: 'خطأ في المدخلات',
          message: validationMessage,
        );
        return;
      }
      SchoolYear newSchoolYear = SchoolYear(
        id: -1,
        name: schoolYearNameController.text,
        isFinished: false,
        previousSchoolYearId: currentSchoolYear.id,
      );
      newSchoolYear = await SchoolYearsDBHelper.instance.insert(newSchoolYear);
      Semester semesterInSchoolYear = Semester(
        id: -1,
        name: firstSemesterNameController.text,
        schoolYearId: newSchoolYear.id,
        isDone: false,
        previousSemesterId: null,
      );
      semesterInSchoolYear =
          await SemestersDBHelper.instance.insert(semesterInSchoolYear);
      Get.back(result: newSchoolYear);
    } on PreviousSchoolYearNotFinishedException catch (e) {
      SnackBarService.showErrorSnackBar(
        title: 'فضل في العملية',
        message: e.message,
      );
    } catch (e) {
      SnackBarService.showErrorSnackBar(
        title: 'فضل في العملية',
        message: 'حدث خطأ اثناء بدء عام دراسي',
      );
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
