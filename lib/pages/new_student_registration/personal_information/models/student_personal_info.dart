// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../models/enums.dart';

class StudentPersonalInfo {
  final int publicRecordId;
  final String firstName;
  final bool isMale;
  final DateTime dateOfBirth;
  final String placeOfBirth;
  final String phoneNumber;
  //enum
  final Religion religion;
  final String whatsappNumber;
  final int incidentNumber;
  final DateTime dateOfIncident;
  final String landline;
  final DateTime joinDate;
  StudentPersonalInfo({
    required this.publicRecordId,
    required this.firstName,
    required this.isMale,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.phoneNumber,
    required this.religion,
    required this.whatsappNumber,
    required this.incidentNumber,
    required this.dateOfIncident,
    required this.landline,
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
    String? whatsappNumber,
    int? incidentNumber,
    DateTime? dateOfIncident,
    String? landline,
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
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      incidentNumber: incidentNumber ?? this.incidentNumber,
      dateOfIncident: dateOfIncident ?? this.dateOfIncident,
      landline: landline ?? this.landline,
      joinDate: joinDate ?? this.joinDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'publicRecordId': publicRecordId,
      'firstName': firstName,
      'isMale': isMale,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'placeOfBirth': placeOfBirth,
      'phoneNumber': phoneNumber,
      'religion': religion.index,
      'whatsappNumber': whatsappNumber,
      'incidentNumber': incidentNumber,
      'dateOfIncident': dateOfIncident.millisecondsSinceEpoch,
      'landline': landline,
      'joinDate': joinDate.millisecondsSinceEpoch,
    };
  }

  factory StudentPersonalInfo.fromMap(Map<String, dynamic> map) {
    return StudentPersonalInfo(
      publicRecordId: map['publicRecordId'] as int,
      firstName: map['firstName'] as String,
      isMale: map['isMale'] as bool,
      dateOfBirth:
          DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int),
      placeOfBirth: map['placeOfBirth'] as String,
      phoneNumber: map['phoneNumber'] as String,
      religion: Religion.values[map['religion'] as int],
      whatsappNumber: map['whatsappNumber'] as String,
      incidentNumber: map['incidentNumber'] as int,
      dateOfIncident:
          DateTime.fromMillisecondsSinceEpoch(map['dateOfIncident'] as int),
      landline: map['landline'] as String,
      joinDate: DateTime.fromMillisecondsSinceEpoch(map['joinDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentPersonalInfo.fromJson(String source) =>
      StudentPersonalInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentPersonalInfo(publicRecordId: $publicRecordId, firstName: $firstName, isMale: $isMale, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, phoneNumber: $phoneNumber, religion: $religion, whatsappNumber: $whatsappNumber, incidentNumber: $incidentNumber, dateOfIncident: $dateOfIncident, landline: $landline, joinDate: $joinDate)';
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
        other.whatsappNumber == whatsappNumber &&
        other.incidentNumber == incidentNumber &&
        other.dateOfIncident == dateOfIncident &&
        other.landline == landline &&
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
        whatsappNumber.hashCode ^
        incidentNumber.hashCode ^
        dateOfIncident.hashCode ^
        landline.hashCode ^
        joinDate.hashCode;
  }
}
