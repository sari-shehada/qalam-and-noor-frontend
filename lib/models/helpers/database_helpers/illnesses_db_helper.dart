import 'package:kalam_noor/models/medical/student_illness.dart';
import 'package:kalam_noor/to_be_disposed/data/dummy_data.dart';

abstract class IllnessesDBHelper {
  static Future<StudentIllness> addStudentIllness(
      StudentIllness studentIllness) async {
    studentIllness = studentIllness.copyWith(id: dummyStudentIllnesses.length);
    dummyStudentIllnesses.add(studentIllness);
    return studentIllness;
  }
}
