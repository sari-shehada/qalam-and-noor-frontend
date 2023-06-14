import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_classes_management_page/main_page/views/dialogs/add_or_edit_school_class_dialog.dart';
import '../../../../../models/educational/school_class.dart';
import '../../../../../models/helpers/database_helpers/school_classes_db_helper.dart';

class SchoolClassManagementController extends GetxController {
  late Rx<Future<RxList<SchoolClass>>> classes;
  Rx<SchoolClassesSortingOption> currentSortingOption =
      SchoolClassesSortingOption.none.obs;
  SchoolClassManagementController() {
    classes = getSchoolClassesToDisplay().obs;
  }

  Future<RxList<SchoolClass>> getSchoolClassesToDisplay() async {
    RxList<SchoolClass> classes = <SchoolClass>[].obs;
    classes.value = await SchoolClassesDBHelper.instance.getAll();

    switch (currentSortingOption.value) {
      case SchoolClassesSortingOption.none:
        return classes;
      case SchoolClassesSortingOption.byNameAsc:
        {
          classes.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return classes;
        }
      case SchoolClassesSortingOption.byNameDesc:
        {
          classes.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return classes;
        }
    }
  }

  Future<void> addNewSchoolClass() async {
    var result = await Get.dialog(
      const AddOrEditSchoolClassDialog(),
      barrierDismissible: true,
    );
    if (result == true) {
      classes.value = getSchoolClassesToDisplay();
    }
  }

  void changeSortingOption(SchoolClassesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    classes.value = getSchoolClassesToDisplay();
  }

  Future<void> updateSchoolClassInfo(SchoolClass schoolClass) async {
    var result = await Get.dialog(
      AddOrEditSchoolClassDialog(
        schoolClass: schoolClass,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      classes.value = getSchoolClassesToDisplay();
    }
  }
}

enum SchoolClassesSortingOption {
  none,
  byNameAsc,
  byNameDesc,
}

Map<SchoolClassesSortingOption, String> schoolClassesSortingOptionsAsString = {
  SchoolClassesSortingOption.none: 'دون ترتيب',
  SchoolClassesSortingOption.byNameAsc: 'حسب ترتيب المرحلة الدراسية تصاعديا',
  SchoolClassesSortingOption.byNameDesc: 'حسب ترتيب المرحلة الدراسية تنازليا',
};
