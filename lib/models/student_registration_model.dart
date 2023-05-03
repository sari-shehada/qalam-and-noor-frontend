// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/models/previous_schools/student_previous_school.dart';

import 'agendas/family.dart';
import 'agendas/father.dart';
import 'agendas/mother.dart';
import 'agendas/responsible_person.dart';
import 'medical/medical_record.dart';
import 'medical/taken_vaccine.dart';

class StudentRegistrationModel {
  final Student student;
  final Family family;
  final Father father;
  final Mother mother;
  final ResponsiblePerson? responsiblePerson;

  final MedicalRecord medicalRecord;
  final List<Illness> illnesses;
  final List<TakenVaccine> takenVaccines;
  final StudentPreviousSchool? studentPreviousSchool;
  final SchoolClass enrolledClass;
  StudentRegistrationModel({
    required this.student,
    required this.family,
    required this.father,
    required this.mother,
    this.responsiblePerson,
    required this.medicalRecord,
    required this.illnesses,
    required this.takenVaccines,
    this.studentPreviousSchool,
    required this.enrolledClass,
  });

  StudentRegistrationModel copyWith({
    Student? student,
    Family? family,
    Father? father,
    Mother? mother,
    ResponsiblePerson? responsiblePerson,
    MedicalRecord? medicalRecord,
    List<Illness>? illnesses,
    List<TakenVaccine>? takenVaccines,
    StudentPreviousSchool? studentPreviousSchool,
    SchoolClass? enrolledClass,
  }) {
    return StudentRegistrationModel(
      student: student ?? this.student,
      family: family ?? this.family,
      father: father ?? this.father,
      mother: mother ?? this.mother,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      medicalRecord: medicalRecord ?? this.medicalRecord,
      illnesses: illnesses ?? this.illnesses,
      takenVaccines: takenVaccines ?? this.takenVaccines,
      studentPreviousSchool:
          studentPreviousSchool ?? this.studentPreviousSchool,
      enrolledClass: enrolledClass ?? this.enrolledClass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'student': student.toMap(),
      'family': family.toMap(),
      'father': father.toMap(),
      'mother': mother.toMap(),
      'responsiblePerson': responsiblePerson?.toMap(),
      'medicalRecord': medicalRecord.toMap(),
      'illnesses': illnesses.map((x) => x.toMap()).toList(),
      'takenVaccines': takenVaccines.map((x) => x.toMap()).toList(),
      'studentPreviousSchool': studentPreviousSchool?.toMap(),
      'enrolledClass': enrolledClass.toMap(),
    };
  }

  factory StudentRegistrationModel.fromMap(Map<String, dynamic> map) {
    return StudentRegistrationModel(
      student: Student.fromMap(map['student'] as Map<String, dynamic>),
      family: Family.fromMap(map['family'] as Map<String, dynamic>),
      father: Father.fromMap(map['father'] as Map<String, dynamic>),
      mother: Mother.fromMap(map['mother'] as Map<String, dynamic>),
      responsiblePerson: map['responsiblePerson'] != null
          ? ResponsiblePerson.fromMap(
              map['responsiblePerson'] as Map<String, dynamic>)
          : null,
      medicalRecord:
          MedicalRecord.fromMap(map['medicalRecord'] as Map<String, dynamic>),
      illnesses: List<Illness>.from(
        (map['illnesses'] as List<int>).map<Illness>(
          (x) => Illness.fromMap(x as Map<String, dynamic>),
        ),
      ),
      takenVaccines: List<TakenVaccine>.from(
        (map['takenVaccines'] as List<int>).map<TakenVaccine>(
          (x) => TakenVaccine.fromMap(x as Map<String, dynamic>),
        ),
      ),
      studentPreviousSchool: map['studentPreviousSchool'] != null
          ? StudentPreviousSchool.fromMap(
              map['studentPreviousSchool'] as Map<String, dynamic>)
          : null,
      enrolledClass:
          SchoolClass.fromMap(map['enrolledClass'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentRegistrationModel.fromJson(String source) =>
      StudentRegistrationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentRegistrationModel(student: $student, family: $family, father: $father, mother: $mother, responsiblePerson: $responsiblePerson, medicalRecord: $medicalRecord, illnesses: $illnesses, takenVaccines: $takenVaccines, studentPreviousSchool: $studentPreviousSchool, enrolledClass: $enrolledClass)';
  }

  @override
  bool operator ==(covariant StudentRegistrationModel other) {
    if (identical(this, other)) return true;

    return other.student == student &&
        other.family == family &&
        other.father == father &&
        other.mother == mother &&
        other.responsiblePerson == responsiblePerson &&
        other.medicalRecord == medicalRecord &&
        listEquals(other.illnesses, illnesses) &&
        listEquals(other.takenVaccines, takenVaccines) &&
        other.studentPreviousSchool == studentPreviousSchool &&
        other.enrolledClass == enrolledClass;
  }

  @override
  int get hashCode {
    return student.hashCode ^
        family.hashCode ^
        father.hashCode ^
        mother.hashCode ^
        responsiblePerson.hashCode ^
        medicalRecord.hashCode ^
        illnesses.hashCode ^
        takenVaccines.hashCode ^
        studentPreviousSchool.hashCode ^
        enrolledClass.hashCode;
  }
}
