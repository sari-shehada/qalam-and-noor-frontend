import 'package:kalam_noor/models/previous_schools/student_previous_school.dart';
import 'package:kalam_noor/to_be_disposed/data/dummy_data.dart';

abstract class PreviousSchoolsDBHelper {
  static Future<StudentPreviousSchool> addStudentPreviousSchool(
      StudentPreviousSchool studentPreviousSchool) async {
    studentPreviousSchool =
        studentPreviousSchool.copyWith(id: dummyStudentPreviousSchools.length);
    dummyStudentPreviousSchools.add(studentPreviousSchool);
    return studentPreviousSchool;
  }
}
