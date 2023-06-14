import 'package:get/get.dart';
import '../../../../../models/educational/classroom.dart';
import '../../../../../models/educational/school_class.dart';
import '../../../../../models/helpers/database_helpers/classrooms_db_helper.dart';
import '../../main_page/controllers/school_classes_management_controller.dart';
import '../views/widgets/add_or_edit_classroom_dialog.dart';

class SchoolClassDetailsController extends GetxController {
  final SchoolClass schoolClass;

  late Rx<Future<List<Classroom>>> classrooms;
  Rx<SchoolClassesSortingOption> currentSortingOption =
      SchoolClassesSortingOption.none.obs;

  SchoolClassDetailsController({
    required this.schoolClass,
  }) {
    classrooms = getClassroomsInClass().obs;
  }

  void changeSortingOption(SchoolClassesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    classrooms.value = getClassroomsInClass();
  }

  Future<List<Classroom>> getClassroomsInClass() async {
    List<Classroom> newClassrooms = await ClassroomDBHelper.instance
        .getAllClassroomsByClassId(schoolClass.id);
    switch (currentSortingOption.value) {
      case SchoolClassesSortingOption.none:
        return newClassrooms;
      case SchoolClassesSortingOption.byNameAsc:
        {
          newClassrooms.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return newClassrooms;
        }
      case SchoolClassesSortingOption.byNameDesc:
        {
          newClassrooms.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return newClassrooms;
        }
    }
  }

  Future<void> addNewClassroom() async {
    var result = await Get.dialog(
      AddOrEditClassroomDialog(
        argument: schoolClass.id,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      classrooms.value = getClassroomsInClass();
    }
  }

  Future<void> updateClassroomInfo(Classroom classroom) async {
    var result = await Get.dialog(
      AddOrEditClassroomDialog(
        argument: classroom,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      classrooms.value = getClassroomsInClass();
    }
  }
}
