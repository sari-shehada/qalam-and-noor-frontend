// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

import 'father.dart';
import 'mother.dart';

class Student {
  final int id;
  final int generalRecordId;
  final String firstName;
  final bool isMale;
  final DateTime dateOfBirth;
  final String placeOfBirth;
  final String phoneNumber;
  //enum
  final Religion religion;
  final String whatsappNumber;
  final String landline;
  final int addressId;
  final DateTime joinDate;
  final DateTime? leaveDate;
  final int? previousSchoolId;
  final int fatherId;
  Father? father;
  final int motherId;
  Mother? mother;
  final int responsiblePersonId;
  Student({
    required this.id,
    required this.generalRecordId,
    required this.firstName,
    required this.isMale,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.phoneNumber,
    required this.religion,
    required this.whatsappNumber,
    required this.landline,
    required this.addressId,
    required this.joinDate,
    this.leaveDate,
    this.previousSchoolId,
    required this.fatherId,
    required this.motherId,
    required this.responsiblePersonId,
  });

  Future<Father> getFatherInfo() async {
    father ??= Father(
        id: 200,
        firstName: 'أحمد',
        lastName: 'ا',
        fatherName: 'محمد',
        motherName: 'فاطمة',
        career: 'طبيب اسنان',
        placeOfResidence: "النبك",
        tieNumber: 400,
        tiePlace: "النبك",
        placeOfBirth: "النبك",
        dateOfBirth: DateTime(
          1994,
        ),
        religion: Religion.islam,
        educationalStatus: EducationalStatus.doctorate,
        phoneNumber: '0999999999',
        permanentAddress: 'النبك / الحي الغربي / شارع ابو سيفو النفوري');
    return father!;
  }

  Future<Mother> getMotherInfo() async {
    mother ??= Mother(
        id: 300,
        firstName: 'سارة',
        lastName: 'س',
        fatherName: 'احمد',
        motherName: 'لما',
        livesWithHusband: true,
        career: 'هندسة تقانة معلومات',
        tieNumber: 213,
        tiePlace: 'النبك',
        placeOfBirth: 'النبك',
        dateOfBirth: DateTime(1995),
        religion: Religion.islam,
        educationalStatus: EducationalStatus.master,
        phoneNumber: '0966666666');
    return mother!;
  }

  Student copyWith({
    int? id,
    int? generalRecordId,
    String? firstName,
    bool? isMale,
    DateTime? dateOfBirth,
    String? placeOfBirth,
    String? phoneNumber,
    Religion? religion,
    String? whatsappNumber,
    String? landline,
    int? addressId,
    DateTime? joinDate,
    DateTime? leaveDate,
    int? previousSchoolId,
    int? fatherId,
    int? motherId,
    int? responsiblePersonId,
  }) {
    return Student(
      id: id ?? this.id,
      generalRecordId: generalRecordId ?? this.generalRecordId,
      firstName: firstName ?? this.firstName,
      isMale: isMale ?? this.isMale,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      religion: religion ?? this.religion,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      landline: landline ?? this.landline,
      addressId: addressId ?? this.addressId,
      joinDate: joinDate ?? this.joinDate,
      leaveDate: leaveDate ?? this.leaveDate,
      previousSchoolId: previousSchoolId ?? this.previousSchoolId,
      fatherId: fatherId ?? this.fatherId,
      motherId: motherId ?? this.motherId,
      responsiblePersonId: responsiblePersonId ?? this.responsiblePersonId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'generalRecordId': generalRecordId,
      'firstName': firstName,
      'isMale': isMale,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'placeOfBirth': placeOfBirth,
      'phoneNumber': phoneNumber,
      'religion': religion.index,
      'whatsappNumber': whatsappNumber,
      'landline': landline,
      'addressId': addressId,
      'joinDate': joinDate.millisecondsSinceEpoch,
      'leaveDate': leaveDate?.millisecondsSinceEpoch,
      'previousSchoolId': previousSchoolId,
      'fatherId': fatherId,
      'motherId': motherId,
      'responsiblePersonId': responsiblePersonId,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      generalRecordId: map['generalRecordId'] as int,
      firstName: map['firstName'] as String,
      isMale: map['isMale'] as bool,
      dateOfBirth:
          DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int),
      placeOfBirth: map['placeOfBirth'] as String,
      phoneNumber: map['phoneNumber'] as String,
      religion: Religion.values[map['religion'] as int],
      whatsappNumber: map['whatsappNumber'] as String,
      landline: map['landline'] as String,
      addressId: map['addressId'] as int,
      joinDate: DateTime.fromMillisecondsSinceEpoch(map['joinDate'] as int),
      leaveDate: map['leaveDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['leaveDate'] as int)
          : null,
      previousSchoolId: map['previousSchoolId'] != null
          ? map['previousSchoolId'] as int
          : null,
      fatherId: map['fatherId'] as int,
      motherId: map['motherId'] as int,
      responsiblePersonId: map['responsiblePersonId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, generalRecordId: $generalRecordId, firstName: $firstName, isMale: $isMale, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, phoneNumber: $phoneNumber, religion: $religion, whatsappNumber: $whatsappNumber, landline: $landline, addressId: $addressId, joinDate: $joinDate, leaveDate: $leaveDate, previousSchoolId: $previousSchoolId, fatherId: $fatherId, motherId: $motherId, responsiblePersonId: $responsiblePersonId)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.generalRecordId == generalRecordId &&
        other.firstName == firstName &&
        other.isMale == isMale &&
        other.dateOfBirth == dateOfBirth &&
        other.placeOfBirth == placeOfBirth &&
        other.phoneNumber == phoneNumber &&
        other.religion == religion &&
        other.whatsappNumber == whatsappNumber &&
        other.landline == landline &&
        other.addressId == addressId &&
        other.joinDate == joinDate &&
        other.leaveDate == leaveDate &&
        other.previousSchoolId == previousSchoolId &&
        other.fatherId == fatherId &&
        other.motherId == motherId &&
        other.responsiblePersonId == responsiblePersonId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        generalRecordId.hashCode ^
        firstName.hashCode ^
        isMale.hashCode ^
        dateOfBirth.hashCode ^
        placeOfBirth.hashCode ^
        phoneNumber.hashCode ^
        religion.hashCode ^
        whatsappNumber.hashCode ^
        landline.hashCode ^
        addressId.hashCode ^
        joinDate.hashCode ^
        leaveDate.hashCode ^
        previousSchoolId.hashCode ^
        fatherId.hashCode ^
        motherId.hashCode ^
        responsiblePersonId.hashCode;
  }
}
