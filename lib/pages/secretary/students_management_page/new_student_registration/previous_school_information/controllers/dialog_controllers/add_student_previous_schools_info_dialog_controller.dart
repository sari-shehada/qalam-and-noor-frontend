import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../../../models/helpers/database_helpers/previous_schools_helpers/previous_schools_db_helper.dart';
import '../../../../../../../models/previous_schools/previous_schools.dart';
import '../add_student_previous_school_info_widget_controller.dart';
import '../../../../../previous_schools/views/dialogs/add_or_edit_previous_school_dialog.dart';

import '../../../../../../../tools/dialogs_services/snack_bar_service.dart';

class AddStudentPreviousSchoolInfoDialogController extends GetxController {
  AddStudentPreviousSchoolInfoDialogController() {
    getSchools();
  }
  Rx<PreviousSchool?> selectedSchool = Rx<PreviousSchool?>(null);
  final TextEditingController notesController = TextEditingController();
  RxBool isProcessing = true.obs;
  RxList<PreviousSchool> previousSchools = <PreviousSchool>[].obs;

  void selectSchool(PreviousSchool? school) {
    if (school != null) {
      selectedSchool.value = school;
      selectedSchool.refresh();
    }
  }

  Future<void> getSchools() async {
    isProcessing.value = true;
    previousSchools.value = await PreviousSchoolsDBHelper.instance.getAll();
    isProcessing.value = false;
  }

  Future<void> addPreviousSchool() async {
    var result = await Get.dialog(const AddOrEditPreviousSchoolDialog());
    if (result == true) {
      getSchools();
    }
  }

  void returnData() {
    if (selectedSchool.value == null) {
      SnackBarService.showErrorSnackBar(
          title: 'لم يتم اختيار مدرسة سابقة',
          message: 'يرجى اختيار مدرسة ومن ثم المتابعة');
      return;
    }
    Get.back(
      result: StudentPreviousSchoolInfo(
          previousSchool: selectedSchool.value!, notes: notesController.text),
    );
  }
}
