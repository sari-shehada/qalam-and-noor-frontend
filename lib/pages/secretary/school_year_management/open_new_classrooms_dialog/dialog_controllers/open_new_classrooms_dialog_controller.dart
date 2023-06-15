import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_year_classrooms_db_helper.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/open_new_classrooms_dialog/dialog_controllers/classrooms_selection_controller.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

class OpenNewClassroomsDialogController extends GetxController {
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  Rx<OpenNewClassroomsLoadingStatus> classesLoadingStatus =
      OpenNewClassroomsLoadingStatus.isLoading.obs;

  Rx<SchoolClass?> selectedClass = Rx<SchoolClass?>(null);
  RxList<SchoolClass> schoolClasses = <SchoolClass>[].obs;
  @override
  void onInit() {
    loadSchoolClasses();
    super.onInit();
  }

  void loadSchoolClasses() async {
    try {
      classesLoadingStatus.value = OpenNewClassroomsLoadingStatus.isLoading;
      schoolClasses.value = await SchoolClassesDBHelper.instance.getAll();
      classesLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasData;
    } catch (e) {
      classesLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasError;
    }
  }

  void selectSchoolClass(SchoolClass schoolClass) {
    if (selectedClass.value != schoolClass) {
      selectedClass.value = schoolClass;
    }
  }

  Future<void> applyChanges() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      await SchoolYearClassroomsDBHelper.instance.openClassroomsInSchoolYear(
          Get.find<ClassroomsSelectionController>().toBeOpenedClassrooms);
      await SchoolYearClassroomsDBHelper.instance.closeClassroomsInSchoolYear(
          Get.find<ClassroomsSelectionController>().toBeClosedClassrooms);
      Get.back();
      SnackBarService.showSuccessSnackBar(
        title: 'تمت العمليات',
        message: 'تم تنفيذ الإجرائات بنجاح',
      );
    } on OpenClassRoomFailException catch (e) {
      SnackBarService.showErrorSnackBar(
        title: 'فشل فتح بعض الشعب',
        message: e.message,
      );
      Get.find<ClassroomsSelectionController>().toBeOpenedClassrooms.clear();
      Get.find<ClassroomsSelectionController>().loadClassroomsInClass();
    } on CloseClassRoomFailException catch (e) {
      SnackBarService.showErrorSnackBar(
        title: 'فشل إغلاق بعض الشعب',
        message: e.message,
      );
      Get.find<ClassroomsSelectionController>().reloadAll();
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}

enum OpenNewClassroomsLoadingStatus {
  isLoading,
  hasData,
  hasError,
}

// enum OpenNewClassroomsPhase {
//   openClassroom,
//   closeClassroom,
// }
