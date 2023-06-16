import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/helpers/database_helpers/classrooms_db_helper.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/main_page/controllers/register_new_students_in_school_year_tab_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';

class ClassroomSelectionSubPageController extends GetxController {
  ClassroomSelectionSubPageController();
  late Rx<Future<List<Classroom>>> classrooms;
  late Rx<Classroom?> selectedClassroom = Rx<Classroom?>(null);

  @override
  void onInit() {
    classrooms = getClassrooms().obs;
    Get.find<RegisterNewStudentsInSchoolYearTabController>()
        .currentPage
        .stream
        .listen(
      (event) {
        if (event == 1) {
          reloadClassrooms();
        }
      },
    );
    super.onInit();
  }

  Future<List<Classroom>> getClassrooms() async {
    int? classId =
        Get.find<ClassSelectionSubPageController>().selectedClass.value?.id;
    if (classId == null) {
      return [];
    }
    return ClassroomDBHelper.instance
        .getAlreadyOpenClassroomsByClassId(classId);
  }

  reloadClassrooms() {
    classrooms.value = getClassrooms();
  }

  selectClassroom(Classroom classroom) {
    selectedClassroom.value = classroom;
  }

  String? validatePageRequirements() {
    if (selectedClassroom.value == null) {
      return 'يرجى اختيار شعبة ضمن المرحلة الدراسية للمتابعة';
    }
    return null;
  }
}
