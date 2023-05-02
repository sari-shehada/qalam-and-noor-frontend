// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PublicRecord {
  String studentFirstName;
  String studentLastName;
  String fatherName;
  String motherName;
  String grandFatherName;
  bool studentGender;
  String studentPlaceOfBirth;
  DateTime studentDateOfBirth;
  String studentPhoneNumber;
  String studentWhataappPhoneNumber;
  String studentLandLine;
  String tieNumber;
  String tiePlace;
  String cityName;
  String areaName;
  String addressName;
  int classId;
  int publicRecordId;
  PublicRecord({
    required this.studentFirstName,
    required this.studentLastName,
    required this.fatherName,
    required this.motherName,
    required this.grandFatherName,
    required this.studentGender,
    required this.studentPlaceOfBirth,
    required this.studentDateOfBirth,
    required this.studentPhoneNumber,
    required this.studentWhataappPhoneNumber,
    required this.studentLandLine,
    required this.tieNumber,
    required this.tiePlace,
    required this.cityName,
    required this.areaName,
    required this.addressName,
    required this.classId,
    required this.publicRecordId,
  });

  PublicRecord copyWith({
    String? studentFirstName,
    String? studentLastName,
    String? fatherName,
    String? motherName,
    String? grandFatherName,
    bool? studentGender,
    String? studentPlaceOfBirth,
    DateTime? studentDateOfBirth,
    String? studentPhoneNumber,
    String? studentWhataappPhoneNumber,
    String? studentLandLine,
    String? tieNumber,
    String? tiePlace,
    String? cityName,
    String? areaName,
    String? addressName,
    int? classId,
    int? publicRecordId,
  }) {
    return PublicRecord(
      studentFirstName: studentFirstName ?? this.studentFirstName,
      studentLastName: studentLastName ?? this.studentLastName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      grandFatherName: grandFatherName ?? this.grandFatherName,
      studentGender: studentGender ?? this.studentGender,
      studentPlaceOfBirth: studentPlaceOfBirth ?? this.studentPlaceOfBirth,
      studentDateOfBirth: studentDateOfBirth ?? this.studentDateOfBirth,
      studentPhoneNumber: studentPhoneNumber ?? this.studentPhoneNumber,
      studentWhataappPhoneNumber:
          studentWhataappPhoneNumber ?? this.studentWhataappPhoneNumber,
      studentLandLine: studentLandLine ?? this.studentLandLine,
      tieNumber: tieNumber ?? this.tieNumber,
      tiePlace: tiePlace ?? this.tiePlace,
      cityName: cityName ?? this.cityName,
      areaName: areaName ?? this.areaName,
      addressName: addressName ?? this.addressName,
      classId: classId ?? this.classId,
      publicRecordId: publicRecordId ?? this.publicRecordId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentFirstName': studentFirstName,
      'studentLastName': studentLastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'grandFatherName': grandFatherName,
      'studentGender': studentGender,
      'studentPlaceOfBirth': studentPlaceOfBirth,
      'studentDateOfBirth': studentDateOfBirth.toIso8601String(),
      'studentPhoneNumber': studentPhoneNumber,
      'studentWhataappPhoneNumber': studentWhataappPhoneNumber,
      'studentLandLine': studentLandLine,
      'tieNumber': tieNumber,
      'tiePlace': tiePlace,
      'cityName': cityName,
      'areaName': areaName,
      'addressName': addressName,
      'classId': classId,
      'publicRecordId': publicRecordId,
    };
  }

  factory PublicRecord.fromMap(Map<String, dynamic> map) {
    return PublicRecord(
      studentFirstName: map['studentFirstName'] as String,
      studentLastName: map['studentLastName'] as String,
      fatherName: map['fatherName'] as String,
      motherName: map['motherName'] as String,
      grandFatherName: map['grandFatherName'] as String,
      studentGender: map['studentGender'] as bool,
      studentPlaceOfBirth: map['studentPlaceOfBirth'] as String,
      studentDateOfBirth: DateTime.parse(map['studentDateOfBirth']),
      studentPhoneNumber: map['studentPhoneNumber'] as String,
      studentWhataappPhoneNumber: map['studentWhataappPhoneNumber'] as String,
      studentLandLine: map['studentLandLine'] as String,
      tieNumber: map['tieNumber'] as String,
      tiePlace: map['tiePlace'] as String,
      cityName: map['cityName'] as String,
      areaName: map['areaName'] as String,
      addressName: map['addressName'] as String,
      classId: map['classId'] as int,
      publicRecordId: map['publicRecordId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicRecord.fromJson(String source) =>
      PublicRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicRecord(studentFirstName: $studentFirstName, studentLastName: $studentLastName, fatherName: $fatherName, motherName: $motherName, grandFatherName: $grandFatherName, studentGender: $studentGender, studentPlaceOfBirth: $studentPlaceOfBirth, studentDateOfBirth: $studentDateOfBirth, studentPhoneNumber: $studentPhoneNumber, studentWhataappPhoneNumber: $studentWhataappPhoneNumber, studentLandLine: $studentLandLine, tieNumber: $tieNumber, tiePlace: $tiePlace, cityName: $cityName, areaName: $areaName, addressName: $addressName, classId: $classId, publicRecordId: $publicRecordId)';
  }

  @override
  bool operator ==(covariant PublicRecord other) {
    if (identical(this, other)) return true;

    return other.studentFirstName == studentFirstName &&
        other.studentLastName == studentLastName &&
        other.fatherName == fatherName &&
        other.motherName == motherName &&
        other.grandFatherName == grandFatherName &&
        other.studentGender == studentGender &&
        other.studentPlaceOfBirth == studentPlaceOfBirth &&
        other.studentDateOfBirth == studentDateOfBirth &&
        other.studentPhoneNumber == studentPhoneNumber &&
        other.studentWhataappPhoneNumber == studentWhataappPhoneNumber &&
        other.studentLandLine == studentLandLine &&
        other.tieNumber == tieNumber &&
        other.tiePlace == tiePlace &&
        other.cityName == cityName &&
        other.areaName == areaName &&
        other.addressName == addressName &&
        other.classId == classId &&
        other.publicRecordId == publicRecordId;
  }

  @override
  int get hashCode {
    return studentFirstName.hashCode ^
        studentLastName.hashCode ^
        fatherName.hashCode ^
        motherName.hashCode ^
        grandFatherName.hashCode ^
        studentGender.hashCode ^
        studentPlaceOfBirth.hashCode ^
        studentDateOfBirth.hashCode ^
        studentPhoneNumber.hashCode ^
        studentWhataappPhoneNumber.hashCode ^
        studentLandLine.hashCode ^
        tieNumber.hashCode ^
        tiePlace.hashCode ^
        cityName.hashCode ^
        areaName.hashCode ^
        addressName.hashCode ^
        classId.hashCode ^
        publicRecordId.hashCode;
  }
}
