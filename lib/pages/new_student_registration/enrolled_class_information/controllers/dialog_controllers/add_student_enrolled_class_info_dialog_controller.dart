import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';

import '../../../../../tools/dialogs_services/snack_bar_service.dart';

class AddStudentEnrolledClassInfoController extends GetxController {
  AddStudentEnrolledClassInfoController() {
    getClasses();
  }

  Rx<SchoolClass?> selectedClass = Rx<SchoolClass?>(null);
  RxBool isProcessing = true.obs;
  RxList<SchoolClass> classes = <SchoolClass>[].obs;

  void selectClass(SchoolClass? schoolClass) {
    if (schoolClass != null) {
      selectedClass.value = schoolClass;
      selectedClass.refresh();
    }
  }

  Future<void> getClasses() async {
    isProcessing.value = true;
    classes.value = await SchoolClassesDBHelper.instance.getAll();
    isProcessing.value = false;
  }

  void returnData() {
    if (selectedClass.value == null) {
      SnackBarService.showErrorSnackBar(
          title: 'لم يتم اختيار صف للطالب',
          message: 'يرجى اختيار صف ومن ثم المتابعة');
      return;
    }
    Get.back(
      result: selectedClass.value,
    );
  }
}
