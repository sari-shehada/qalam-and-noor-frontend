// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Student {
  final int id;
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
  final int addressId;
  final DateTime joinDate;
  final DateTime? leaveDate;
  final int? medicalRecordId;
  final int? previousSchoolId;
  final int familyId;
  Student({
    required this.id,
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
    required this.addressId,
    required this.joinDate,
    this.leaveDate,
    this.medicalRecordId,
    this.previousSchoolId,
    required this.familyId,
  });

  // Future<Father> getFatherInfo() async {
  //   father ??= Father(
  //       id: 200,
  //       firstName: 'أحمد',
  //       lastName: 'ا',
  //       fatherName: 'محمد',
  //       motherName: 'فاطمة',
  //       career: 'طبيب اسنان',
  //       placeOfResidence: "النبك",
  //       tieNumber: 400,
  //       tiePlace: "النبك",
  //       placeOfBirth: "النبك",
  //       dateOfBirth: DateTime(
  //         1994,
  //       ),
  //       religion: Religion.islam,
  //       educationalStatus: EducationalStatus.doctorate,
  //       phoneNumber: '0999999999',
  //       permanentAddress: 'النبك / الحي الغربي / شارع ابو سيفو النفوري',
  //       civilRegisterSecretary: '');
  //   return father!;
  // }

  // Future<Mother> getMotherInfo() async {
  //   mother ??= Mother(
  //       id: 300,
  //       firstName: 'سارة',
  //       lastName: 'س',
  //       fatherName: 'احمد',
  //       motherName: 'لما',
  //       doesLiveWithHusband: true,
  //       career: 'هندسة تقانة معلومات',
  //       tieNumber: 213,
  //       tiePlace: 'النبك',
  //       placeOfBirth: 'النبك',
  //       dateOfBirth: DateTime(1995),
  //       religion: Religion.islam,
  //       educationalStatus: EducationalStatus.master,
  //       phoneNumber: '0966666666');
  //   return mother!;
  // }

  Student copyWith({
    int? id,
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
    int? addressId,
    DateTime? joinDate,
    DateTime? leaveDate,
    int? medicalRecordId,
    int? previousSchoolId,
    int? familyId,
  }) {
    return Student(
      id: id ?? this.id,
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
      addressId: addressId ?? this.addressId,
      joinDate: joinDate ?? this.joinDate,
      leaveDate: leaveDate ?? this.leaveDate,
      medicalRecordId: medicalRecordId ?? this.medicalRecordId,
      previousSchoolId: previousSchoolId ?? this.previousSchoolId,
      familyId: familyId ?? this.familyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      'addressId': addressId,
      'joinDate': joinDate.millisecondsSinceEpoch,
      'leaveDate': leaveDate?.millisecondsSinceEpoch,
      'medicalRecordId': medicalRecordId,
      'previousSchoolId': previousSchoolId,
      'familyId': familyId,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
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
      addressId: map['addressId'] as int,
      joinDate: DateTime.fromMillisecondsSinceEpoch(map['joinDate'] as int),
      leaveDate: map['leaveDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['leaveDate'] as int)
          : null,
      medicalRecordId:
          map['medicalRecordId'] != null ? map['medicalRecordId'] as int : null,
      previousSchoolId: map['previousSchoolId'] != null
          ? map['previousSchoolId'] as int
          : null,
      familyId: map['familyId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, publicRecordId: $publicRecordId, firstName: $firstName, isMale: $isMale, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, phoneNumber: $phoneNumber, religion: $religion, whatsappNumber: $whatsappNumber, incidentNumber: $incidentNumber, dateOfIncident: $dateOfIncident, landline: $landline, addressId: $addressId, joinDate: $joinDate, leaveDate: $leaveDate, medicalRecordId: $medicalRecordId, previousSchoolId: $previousSchoolId, familyId: $familyId)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.publicRecordId == publicRecordId &&
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
        other.addressId == addressId &&
        other.joinDate == joinDate &&
        other.leaveDate == leaveDate &&
        other.medicalRecordId == medicalRecordId &&
        other.previousSchoolId == previousSchoolId &&
        other.familyId == familyId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        publicRecordId.hashCode ^
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
        addressId.hashCode ^
        joinDate.hashCode ^
        leaveDate.hashCode ^
        medicalRecordId.hashCode ^
        previousSchoolId.hashCode ^
        familyId.hashCode;
  }
}
