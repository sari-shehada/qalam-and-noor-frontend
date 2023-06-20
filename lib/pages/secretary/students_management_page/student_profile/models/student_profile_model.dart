// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/models/medical/student_vaccines_info.dart';
import 'package:kalam_noor/models/previous_schools/previous_schools.dart';

import '../../../../../models/medical/student_illness_info.dart';
import '../../../../../models/medical/student_psychological_status_info.dart';

class StudentProfileInfo {
  final Student student;
  final Father father;
  final Mother mother;
  final ResponsiblePerson? responsiblePerson;
  final List<Student> sibling;
  final List<PreviousSchool> previousSchools;
  final Address address;
  final Area area;
  final City city;
  final List<StudentIllnessInfo> illnesses;
  final List<StudentVaccineInfo> vaccines;
  final List<PsychologicalStatusInfo> psychologicalStatuses;
  final SchoolClass? currentClass;
  final Classroom? currentClassroom;
  final List<SchoolYear> studentSchoolYears;
  StudentProfileInfo({
    required this.student,
    required this.father,
    required this.mother,
    this.responsiblePerson,
    required this.sibling,
    required this.previousSchools,
    required this.address,
    required this.area,
    required this.city,
    required this.illnesses,
    required this.vaccines,
    required this.psychologicalStatuses,
    this.currentClass,
    this.currentClassroom,
    required this.studentSchoolYears,
  });

  StudentProfileInfo copyWith({
    Student? student,
    Father? father,
    Mother? mother,
    ResponsiblePerson? responsiblePerson,
    List<Student>? sibling,
    List<PreviousSchool>? previousSchools,
    Address? address,
    Area? area,
    City? city,
    List<StudentIllnessInfo>? illnesses,
    List<StudentVaccineInfo>? vaccines,
    List<PsychologicalStatusInfo>? psychologicalStatuses,
    SchoolClass? currentClass,
    Classroom? currentClassroom,
    List<SchoolYear>? studentSchoolYears,
  }) {
    return StudentProfileInfo(
      student: student ?? this.student,
      father: father ?? this.father,
      mother: mother ?? this.mother,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      sibling: sibling ?? this.sibling,
      previousSchools: previousSchools ?? this.previousSchools,
      address: address ?? this.address,
      area: area ?? this.area,
      city: city ?? this.city,
      illnesses: illnesses ?? this.illnesses,
      vaccines: vaccines ?? this.vaccines,
      psychologicalStatuses:
          psychologicalStatuses ?? this.psychologicalStatuses,
      currentClass: currentClass ?? this.currentClass,
      currentClassroom: currentClassroom ?? this.currentClassroom,
      studentSchoolYears: studentSchoolYears ?? this.studentSchoolYears,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'student': student.toMap(),
      'father': father.toMap(),
      'mother': mother.toMap(),
      'responsiblePerson': responsiblePerson?.toMap(),
      'sibling': sibling.map((x) => x.toMap()).toList(),
      'previousSchools': previousSchools.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
      'area': area.toMap(),
      'city': city.toMap(),
      'illnesses': illnesses.map((x) => x.toMap()).toList(),
      'vaccines': vaccines.map((x) => x.toMap()).toList(),
      'psychologicalStatuses':
          psychologicalStatuses.map((x) => x.toMap()).toList(),
      'currentClass': currentClass?.toMap(),
      'currentClassroom': currentClassroom?.toMap(),
      'studentSchoolYears': studentSchoolYears.map((x) => x.toMap()).toList(),
    };
  }

  factory StudentProfileInfo.fromMap(Map<String, dynamic> map) {
    return StudentProfileInfo(
      student: Student.fromMap(map['student'] as Map<String, dynamic>),
      father: Father.fromMap(map['father'] as Map<String, dynamic>),
      mother: Mother.fromMap(map['mother'] as Map<String, dynamic>),
      responsiblePerson: map['responsiblePerson'] != null
          ? ResponsiblePerson.fromMap(
              map['responsiblePerson'] as Map<String, dynamic>)
          : null,
      sibling: List<Student>.from(
        (map['sibling'] as List).map<Student>(
          (x) => Student.fromMap(x as Map<String, dynamic>),
        ),
      ),
      previousSchools: List<PreviousSchool>.from(
        (map['previousSchools'] as List).map<PreviousSchool>(
          (x) => PreviousSchool.fromMap(x as Map<String, dynamic>),
        ),
      ),
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
      area: Area.fromMap(map['area'] as Map<String, dynamic>),
      city: City.fromMap(map['city'] as Map<String, dynamic>),
      illnesses: List<StudentIllnessInfo>.from(
        (map['illnesses'] as List).map<StudentIllnessInfo>(
          (x) => StudentIllnessInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      vaccines: List<StudentVaccineInfo>.from(
        (map['vaccines'] as List).map<StudentVaccineInfo>(
          (x) => StudentVaccineInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      psychologicalStatuses: List<PsychologicalStatusInfo>.from(
        (map['psychologicalStatuses'] as List).map<PsychologicalStatusInfo>(
          (x) => PsychologicalStatusInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      currentClass: map['currentClass'] != null
          ? SchoolClass.fromMap(map['currentClass'] as Map<String, dynamic>)
          : null,
      currentClassroom: map['currentClassroom'] != null
          ? Classroom.fromMap(map['currentClassroom'] as Map<String, dynamic>)
          : null,
      studentSchoolYears: List<SchoolYear>.from(
        (map['studentSchoolYears'] as List).map<SchoolYear>(
          (x) => SchoolYear.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileInfo.fromJson(String source) =>
      StudentProfileInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentProfileInfo(student: $student, father: $father, mother: $mother, responsiblePerson: $responsiblePerson, sibling: $sibling, previousSchools: $previousSchools, address: $address, area: $area, city: $city, illnesses: $illnesses, vaccines: $vaccines, psychologicalStatuses: $psychologicalStatuses, currentClass: $currentClass, currentClassroom: $currentClassroom, studentSchoolYears: $studentSchoolYears)';
  }

  @override
  bool operator ==(covariant StudentProfileInfo other) {
    if (identical(this, other)) return true;

    return other.student == student &&
        other.father == father &&
        other.mother == mother &&
        other.responsiblePerson == responsiblePerson &&
        listEquals(other.sibling, sibling) &&
        listEquals(other.previousSchools, previousSchools) &&
        other.address == address &&
        other.area == area &&
        other.city == city &&
        listEquals(other.illnesses, illnesses) &&
        listEquals(other.vaccines, vaccines) &&
        listEquals(other.psychologicalStatuses, psychologicalStatuses) &&
        other.currentClass == currentClass &&
        other.currentClassroom == currentClassroom &&
        listEquals(other.studentSchoolYears, studentSchoolYears);
  }

  @override
  int get hashCode {
    return student.hashCode ^
        father.hashCode ^
        mother.hashCode ^
        responsiblePerson.hashCode ^
        sibling.hashCode ^
        previousSchools.hashCode ^
        address.hashCode ^
        area.hashCode ^
        city.hashCode ^
        illnesses.hashCode ^
        vaccines.hashCode ^
        psychologicalStatuses.hashCode ^
        currentClass.hashCode ^
        currentClassroom.hashCode ^
        studentSchoolYears.hashCode;
  }
}
