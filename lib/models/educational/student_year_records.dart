// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/models/educational/year_record.dart';

class StudentYearRecords {
  final SchoolYear schoolYear;
  final List<Semester> semesters;
  final SchoolClass schoolClass;
  final Classroom classroom;
  final YearRecord yearRecord;
  StudentYearRecords({
    required this.schoolYear,
    required this.semesters,
    required this.schoolClass,
    required this.classroom,
    required this.yearRecord,
  });

  StudentYearRecords copyWith({
    SchoolYear? schoolYear,
    List<Semester>? semesters,
    SchoolClass? schoolClass,
    Classroom? classroom,
    YearRecord? yearRecord,
  }) {
    return StudentYearRecords(
      schoolYear: schoolYear ?? this.schoolYear,
      semesters: semesters ?? this.semesters,
      schoolClass: schoolClass ?? this.schoolClass,
      classroom: classroom ?? this.classroom,
      yearRecord: yearRecord ?? this.yearRecord,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolYear': schoolYear.toMap(),
      'semesters': semesters.map((x) => x.toMap()).toList(),
      'class': schoolClass.toMap(),
      'classRoom': classroom.toMap(),
      'yearRecord': yearRecord.toMap(),
    };
  }

  factory StudentYearRecords.fromMap(Map<String, dynamic> map) {
    return StudentYearRecords(
      schoolYear: SchoolYear.fromMap(map['schoolYear'] as Map<String, dynamic>),
      semesters: List<Semester>.from(
        (map['semesters'] as List<int>).map<Semester>(
          (x) => Semester.fromMap(x as Map<String, dynamic>),
        ),
      ),
      schoolClass:
          SchoolClass.fromMap(map['schoolClass'] as Map<String, dynamic>),
      classroom: Classroom.fromMap(map['classroom'] as Map<String, dynamic>),
      yearRecord: YearRecord.fromMap(map['yearRecord'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentYearRecords.fromJson(String source) =>
      StudentYearRecords.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentYearRecord(schoolYear: $schoolYear, semesters: $semesters, '
        'schoolClass: $schoolClass, classroom: $classroom, yearRecord: $yearRecord)';
  }

  @override
  bool operator ==(covariant StudentYearRecords other) {
    if (identical(this, other)) return true;

    return other.schoolYear == schoolYear &&
        listEquals(other.semesters, semesters) &&
        other.schoolClass == schoolClass &&
        other.classroom == classroom &&
        other.yearRecord == yearRecord;
  }

  @override
  int get hashCode {
    return schoolYear.hashCode ^
        semesters.hashCode ^
        schoolClass.hashCode ^
        classroom.hashCode ^
        yearRecord.hashCode;
  }
}
