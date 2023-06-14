// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../../../models/enums.dart';

class StudentPersonalInfo {
  final int publicRecordId;
  final String firstName;
  final bool isMale;
  final DateTime dateOfBirth;
  final String placeOfBirth;
  final String phoneNumber;
  //enum
  final Religion religion;
  final String whatsappPhoneNumber;
  final String incidentNumber;
  final DateTime incidentDate;
  final String landLine;
  final DateTime joinDate;

  StudentPersonalInfo({
    required this.publicRecordId,
    required this.firstName,
    required this.isMale,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.phoneNumber,
    required this.religion,
    required this.whatsappPhoneNumber,
    required this.incidentNumber,
    required this.incidentDate,
    required this.landLine,
    required this.joinDate,
  });

  StudentPersonalInfo copyWith({
    int? publicRecordId,
    String? firstName,
    bool? isMale,
    DateTime? dateOfBirth,
    String? placeOfBirth,
    String? phoneNumber,
    Religion? religion,
    String? whatsappPhoneNumber,
    String? incidentNumber,
    DateTime? incidentDate,
    String? landLine,
    DateTime? joinDate,
  }) {
    return StudentPersonalInfo(
      publicRecordId: publicRecordId ?? this.publicRecordId,
      firstName: firstName ?? this.firstName,
      isMale: isMale ?? this.isMale,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      religion: religion ?? this.religion,
      whatsappPhoneNumber: whatsappPhoneNumber ?? this.whatsappPhoneNumber,
      incidentNumber: incidentNumber ?? this.incidentNumber,
      incidentDate: incidentDate ?? this.incidentDate,
      landLine: landLine ?? this.landLine,
      joinDate: joinDate ?? this.joinDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'publicRecordId': publicRecordId,
      'firstName': firstName,
      'isMale': isMale,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'placeOfBirth': placeOfBirth,
      'phoneNumber': phoneNumber,
      'religion': religion.index,
      'whatsappPhoneNumber': whatsappPhoneNumber,
      'incidentNumber': incidentNumber,
      'incidentDate': incidentDate.toIso8601String(),
      'landLine': landLine,
      'joinDate': joinDate.toIso8601String(),
    };
  }

  factory StudentPersonalInfo.fromMap(Map<String, dynamic> map) {
    return StudentPersonalInfo(
      publicRecordId: map['publicRecordId'] as int,
      firstName: map['firstName'] as String,
      isMale: map['isMale'] as bool,
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      placeOfBirth: map['placeOfBirth'] as String,
      phoneNumber: map['phoneNumber'] as String,
      religion: Religion.values[map['religion'] as int],
      whatsappPhoneNumber: map['whatsappPhoneNumber'] as String,
      incidentNumber: map['incidentNumber'] as String,
      incidentDate: DateTime.parse(map['incidentDate']),
      landLine: map['landLine'] as String,
      joinDate: DateTime.parse(map['joinDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentPersonalInfo.fromJson(String source) =>
      StudentPersonalInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentPersonalInfo( publicRecordId: $publicRecordId, firstName: $firstName, isMale: $isMale, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, phoneNumber: $phoneNumber, religion: $religion, whatsappPhoneNumber: $whatsappPhoneNumber, incidentNumber: $incidentNumber, incidentDate: $incidentDate, landLine: $landLine, joinDate: $joinDate)';
  }

  @override
  bool operator ==(covariant StudentPersonalInfo other) {
    if (identical(this, other)) return true;

    return other.publicRecordId == publicRecordId &&
        other.firstName == firstName &&
        other.isMale == isMale &&
        other.dateOfBirth == dateOfBirth &&
        other.placeOfBirth == placeOfBirth &&
        other.phoneNumber == phoneNumber &&
        other.religion == religion &&
        other.whatsappPhoneNumber == whatsappPhoneNumber &&
        other.incidentNumber == incidentNumber &&
        other.incidentDate == incidentDate &&
        other.landLine == landLine &&
        other.joinDate == joinDate;
  }

  @override
  int get hashCode {
    return publicRecordId.hashCode ^
        firstName.hashCode ^
        isMale.hashCode ^
        dateOfBirth.hashCode ^
        placeOfBirth.hashCode ^
        phoneNumber.hashCode ^
        religion.hashCode ^
        whatsappPhoneNumber.hashCode ^
        incidentNumber.hashCode ^
        incidentDate.hashCode ^
        landLine.hashCode ^
        joinDate.hashCode;
  }
}
