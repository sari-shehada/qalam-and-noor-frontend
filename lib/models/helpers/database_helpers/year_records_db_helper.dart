import 'package:kalam_noor/models/educational/year_record.dart';
import 'package:kalam_noor/to_be_disposed/data/dummy_data.dart';

abstract class YearRecordsDBHelper {
  static Future<YearRecord> addStudentYearRecord(
      {required int studentId, required int classId}) async {
    YearRecord yearRecord = YearRecord(
        id: -1,
        classId: classId,
        schoolYearClassroomId: null,
        studentId: studentId,
        didPass: null);
    yearRecord = yearRecord.copyWith(id: dummyYearRecords.length);
    dummyYearRecords.add(yearRecord);
    return yearRecord;
  }
}
