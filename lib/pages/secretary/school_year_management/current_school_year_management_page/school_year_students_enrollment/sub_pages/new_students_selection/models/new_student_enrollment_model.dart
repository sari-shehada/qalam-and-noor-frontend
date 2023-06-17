// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../../../../../models/agendas/student.dart';
import '../../../../../../../../models/educational/year_record.dart';

class NewStudentEnrollmentModel {
  final Student student;
  final YearRecord yearRecord;
  NewStudentEnrollmentModel({
    required this.student,
    required this.yearRecord,
  });

  NewStudentEnrollmentModel copyWith({
    Student? student,
    YearRecord? yearRecord,
  }) {
    return NewStudentEnrollmentModel(
      student: student ?? this.student,
      yearRecord: yearRecord ?? this.yearRecord,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'student': student.toMap(),
      'yearRecord': yearRecord.toMap(),
    };
  }

  factory NewStudentEnrollmentModel.fromMap(Map<String, dynamic> map) {
    return NewStudentEnrollmentModel(
      student: Student.fromMap(map['student'] as Map<String, dynamic>),
      yearRecord: YearRecord.fromMap(map['yearRecord'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewStudentEnrollmentModel.fromJson(String source) =>
      NewStudentEnrollmentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SchoolYearNewStudentRegistrationModel(student: $student, yearRecord: $yearRecord)';

  @override
  bool operator ==(covariant NewStudentEnrollmentModel other) {
    if (identical(this, other)) return true;

    return other.student == student && other.yearRecord == yearRecord;
  }

  @override
  int get hashCode => student.hashCode ^ yearRecord.hashCode;
}
